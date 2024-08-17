import 'package:go_router/go_router.dart';
import 'package:send_money_app/error_screen.dart';
import 'package:send_money_app/features/history/presentation/pages/history.dart';
import 'package:send_money_app/features/savings/presentation/pages/savings_page.dart';
import 'package:send_money_app/features/transaction/presentation/pages/transaction.dart';

import 'route_utils.dart';

class MyRouter {
  late final GoRouter routes = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    initialLocation: AppPage.home.path,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SavingsPage();
        },
      ),
      GoRoute(
        path: '/history',
        builder: (context, state) {
          return const HistoryPage();
        },
      ),
      GoRoute(
        path: '/transaction',
        builder: (context, state) {
          return const TransactionPage();
        },
      ),
    ],
  );
}
