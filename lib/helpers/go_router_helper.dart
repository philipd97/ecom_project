import '../views/home_page.dart';

import '../views/get_started_page.dart';
import '../views/login_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: GetStartedPage.routeName,
      builder: (context, state) => const GetStartedPage(),
      routes: [
        GoRoute(
          path: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
        ),
        // CHANGE THIS
        GoRoute(
          path: HomePage.routeName,
          builder: (context, state) => const HomePage(),
        ),
      ],
    ),
  ],
);
