import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:send_money_app/my_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-end Testing', () {
    testWidgets('Show And Hide functionality test.', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Hi Janjan'), findsOneWidget);

      final eyeIcon = find.byKey(const Key('ShowHideMoneyKey'));

      await tester.tap(eyeIcon);

      await tester.pumpAndSettle();

      expect(find.text('₱ 500.00'), findsOneWidget);

      await tester.tap(eyeIcon);

      await tester.pumpAndSettle();

      expect(find.text('₱ *****'), findsOneWidget);
    });
    testWidgets('Go to Transaction Page and Write name and amount.',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Hi Janjan'), findsOneWidget);

      final sendMoneyButton = find.byKey(const Key('SendMoneyKey'));

      await tester.tap(sendMoneyButton);

      await tester.pumpAndSettle();

      expect(find.text('Send Money'), findsWidgets);

      final txtReceiver = find.byKey(const Key('ReceiverNameKey'));
      final txtAmount = find.byKey(const Key('AmountKey'));

      await tester.enterText(txtReceiver, 'Jaime Jr. D. Aballe');
      await tester.enterText(txtAmount, '100');
      await tester.pumpAndSettle();

      await tester.pageBack();
      await tester.pumpAndSettle();
    });
    testWidgets('Go to History Page and Back.', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('Hi Janjan'), findsOneWidget);

      final viewAllLabel = find.byKey(const Key('ViewAllKey'));

      await tester.tap(viewAllLabel);

      await tester.pumpAndSettle();

      expect(find.text('Transaction History'), findsWidgets);

      await tester.pageBack();
      await tester.pumpAndSettle();
    });
  });
}
