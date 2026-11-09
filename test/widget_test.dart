import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_spx/main.dart';

void main() {
  testWidgets('SPX Express all 8 screens render smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const SpxExpressApp());
    expect(find.text('My Utilities'), findsOneWidget);
    expect(find.text('Delayed Parcel\nSupport'), findsOneWidget);
    expect(find.text('Your parcel may be delayed'), findsOneWidget);
    expect(find.text('Why is my parcel delayed?'), findsOneWidget);
    expect(find.text('Delivery time and\nstatus updates'), findsOneWidget);
    expect(find.text('How can I help you?'), findsOneWidget);
    expect(find.text('Submit Support Request?'), findsOneWidget);
    expect(find.text('Track Support Request'), findsOneWidget);
    expect(find.text('Resolution Update'), findsOneWidget);
  });
}
