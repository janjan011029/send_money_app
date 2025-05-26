import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money_app/error_screen.dart';
import 'package:send_money_app/features/history/presentation/pages/history.dart';
import 'package:send_money_app/features/home/presentation/pages/home.dart';
import 'package:send_money_app/features/profile/presentation/pages/profile.dart';
import 'package:send_money_app/features/savings/presentation/pages/savings_page.dart';
import 'package:send_money_app/features/transaction/presentation/pages/transaction.dart';

import 'route_utils.dart';

class MyRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _sectionANavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

  late final GoRouter routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    errorBuilder: (context, state) => const ErrorScreen(),
    initialLocation: AppPage.savings.path, // Make sure this exists
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: [
              GoRoute(
                path: AppPage.savings.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SavingsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppPage.history.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HistoryPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppPage.profile.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppPage.transaction.path,
        builder: (context, state) => const TransactionPage(),
      ),
    ],
  );
}
