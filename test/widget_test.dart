import 'package:flutter_test/flutter_test.dart';
import 'package:app_spx/main.dart';

void main() {
  testWidgets('SPX Express all 7 screens render smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SpxExpressApp());
    expect(find.text('Your parcel may be delayed'), findsOneWidget);
    expect(find.text('Why is my parcel delayed?'), findsOneWidget);
    expect(find.text('Delivery time and\nstatus updates'), findsOneWidget);
    expect(find.text('How can I help you?'), findsOneWidget);
    expect(find.text('Submit Support Request?'), findsOneWidget);
    expect(find.text('Track Support Request'), findsOneWidget);
    expect(find.text('Resolution Update'), findsOneWidget);
  });
}
