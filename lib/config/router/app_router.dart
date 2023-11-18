import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/views/home/dashboard/dashboard_view.dart';
import 'package:gin/views/home/home_view.dart';
import 'package:gin/views/home/shopping_cart/shopping_cart_view.dart';
import 'package:gin/views/login/login_view.dart';
import 'package:gin/views/login/register_view.dart';
import 'package:gin/views/startup/startup_view.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: startUpRoute,
      builder: (context, state) => const StartUpView(),
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: registerRoute,
      builder: (context, state) => const RegisterView(),
    ),
    ShellRoute(
      parentNavigatorKey: _rootNavigatorKey,
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomeView(
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: dashboardRoute,
          builder: (context, state) => DashboardView(),
        ),
        GoRoute(
          path: shoppingCartRoute,
          builder: (context, state) => ShoppingCartView(),
        )
      ],
    ),
  ],
);
