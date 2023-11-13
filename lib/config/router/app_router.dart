import 'package:gin/constants/strings.dart';
import 'package:gin/views/login/login_view.dart';
import 'package:gin/views/startup/startup_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: startUpRoute,
      builder: (context, state) => const StartUpView(),
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) => const LoginView(),
    )
  ],
);
