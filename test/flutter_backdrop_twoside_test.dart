import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_backdrop_twoside/flutter_backdrop_twoside.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_backdrop_twoside');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    //expect(await FlutterBackdropTwoside.platformVersion, '42');
  });
}
