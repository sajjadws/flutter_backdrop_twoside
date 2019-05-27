import 'package:flutter/material.dart';
import 'dart:async';

class BackDrop extends StatefulWidget {
  final Widget headLayout;
  final Widget leftLayout;
  final Widget rightLayout;
  final Widget frontLayout;
  final Color headColor;
  final double headHeight;
  final Icon leftIconCollapse;
  final Icon leftIconExpand;
  final Icon rightIconCollapse;
  final Icon rightIconExpand;

  BackDrop({
    this.headLayout,
    this.leftLayout,
    this.rightLayout,
    this.frontLayout,
    this.headColor,
    this.headHeight,
    this.leftIconCollapse,
    this.leftIconExpand,
    this.rightIconCollapse,
    this.rightIconExpand,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BackDropState();
  }
}

class BackDropState extends State<BackDrop> with SingleTickerProviderStateMixin {

  ///// keys use for getting size of widgets
  /////// size var
  GlobalKey _keyHeader = GlobalKey();
  GlobalKey _keyLeftPanel = GlobalKey();
  GlobalKey _keyRightPanel = GlobalKey();

  var headerSize = 0.0;
  var leftPanelSize = 0.0;
  var rightPanelSize = 0.0;



  /////// header icon var

  bool leftIconVisible = true;
  bool rightIconVisible = true;


  /////// amimation var
  AnimationController controller;

  /////// pageview var
  PageController _pageController = new PageController();
  int page = 0;

  /////////////////////////////////// main works ///////////////////////////////
  @override
  void initState() {


    /////////// if want to get something after layouts created use this
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    super.initState();

    //////////// animation controller
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 5000));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Theme.of(context).primaryColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            child: Stack(
              children: <Widget>[
                new Container(margin: EdgeInsets.only(top: widget.headHeight),
                  child: new PageView(
                    onPageChanged: onPageChanged,
                    controller: _pageController,
                    physics:
                    ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                    children: <Widget>[_buildLeftPanel(), _buildRightPanel()],
                  ),),
                _buildHeaderPanel(),
                PositionedTransition(
                  rect: getPanelAnimation(context, constraints),
                  child: _buildFrontPanel(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  ////////////////////////////////////page view controller /////////////////////

  void onPageChanged(int value) {
    setState(() {
      this.page = value;
    });
  }

  //////////////////////////////////// size work ///////////////////////////////
  _getHeaderSizes() {
    final RenderBox renderBoxRed = _keyHeader.currentContext.findRenderObject();
    print("SIZE of Red: ${renderBoxRed.size.height}");
    return renderBoxRed.size.height;
  }

  _getLeftPanelSizes() {
    final RenderBox renderBoxRed =
    _keyLeftPanel.currentContext.findRenderObject();

    return renderBoxRed.size.height;
  }

  _getRightPanelSizes() {
    final RenderBox renderBoxRed =
    _keyRightPanel.currentContext.findRenderObject();
    print("SIZE of Red: ${renderBoxRed.size.height}");
    return renderBoxRed.size.height;
  }

  _afterLayout(_) {
    setState(() {
      headerSize = _getHeaderSizes();
      leftPanelSize = _getLeftPanelSizes();
    });
  }


  /////////////////////////// clicking on header icons work ////////////////////
  void flingLeft() {


    if(rightIconVisible){



      setState(() {
        rightIconVisible = false;
      });

    }else{

      setState(() {
        rightIconVisible = true;
      });


    }






    controller.fling(velocity: isTopPanelVisible ? -1.0 : 1.0);

    setState(() {
      _pageController.jumpToPage(0);


    });
  }

  void flingRight() {
    controller.fling(velocity: isTopPanelVisible ? -1.0 : 1.0);



    if(leftIconVisible){

      print(leftIconVisible);

      setState(() {
        leftIconVisible = false;



      });

    }else{

      setState(() {
        leftIconVisible = true;
      });


    }





    _a(_) {
      setState(() {
        rightPanelSize = _getRightPanelSizes();
      });
    }

    setState(() {

      _pageController.jumpToPage(1);

      WidgetsBinding.instance.addPostFrameCallback(_a);



    });




  }


  /////////////////////////// animatin work ////////////////////////////////////
  bool get isTopPanelVisible {

    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  Icon rightIcon(){

    if(leftIconVisible){
      return widget.rightIconCollapse;
    }else{
      return widget.rightIconExpand;
    }

  }

  Icon leftIcon(){

    if(rightIconVisible){
      return widget.leftIconCollapse;
    }else{
      return widget.leftIconExpand;
    }

  }

  RelativeRect endAnimation(BuildContext context){



    if(page == 0) {

      double maxSize = 0.0;
      double screenHeight = MediaQuery.of(context).size.height;
      double pannelHeight = leftPanelSize + headerSize;
      if(pannelHeight >= screenHeight - headerSize) {
        maxSize = screenHeight - 32;

      }else {
        maxSize = pannelHeight;

      }

      return RelativeRect.fromLTRB(0.0, maxSize, 0.0, 0.0);
    }else if(page == 1){





      return RelativeRect.fromLTRB(0.0, rightPanelSize + headerSize, 0.0, 0.0);

    }

  }

  Animation<RelativeRect> getPanelAnimation(
      BuildContext context, BoxConstraints constraints) {


    print(page);





    final height = constraints.biggest.height;
    final backPanelHeight = widget.headHeight;
    final frontPanelHeight = -backPanelHeight;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, 0.0),
      end: endAnimation(context) ,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }


  ///// build different part of widget such header and back and front views ////
  Widget _buildHeaderPanel() {
    return Material(
        color: widget.headColor,
        child: new Container(
          key: _keyHeader,
          height: widget.headHeight,
          child: new Container(padding: EdgeInsets.only(top: 26), child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Visibility(visible: leftIconVisible,child: new IconButton(
                  icon: leftIcon(),
                  onPressed: flingLeft),),
              widget.headLayout,
              new Visibility(visible: rightIconVisible,child: new IconButton(
                  icon: rightIcon(),
                  onPressed: flingRight),),

            ],
          ),),
        ));
  }

  Widget _buildLeftPanel() {
    return Stack(
      children: <Widget>[

        new SizedBox(
          key: _keyLeftPanel,
          width: MediaQuery.of(context).size.width,
          child: widget.leftLayout,

        )

      ],

    );
  }

  Widget _buildRightPanel() {
    return Stack(
      children: <Widget>[

        new SizedBox(
          key: _keyRightPanel,
          width: MediaQuery.of(context).size.width,
          child: widget.rightLayout,

        )

      ],

    );
  }

  Widget _buildFrontPanel(BuildContext context) {
    return widget.frontLayout;
  }


}
