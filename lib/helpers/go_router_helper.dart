import 'package:ecom_project/views/checkout_page.dart';
import 'package:ecom_project/views/favorite_page.dart';
import 'package:ecom_project/views/profile_page.dart';
import 'package:go_router/go_router.dart';

import '../views/basket_page.dart';
import '../views/get_started_page.dart';
import '../views/home_page.dart';
import '../views/login_page.dart';
import '../views/product_detail_page.dart';

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
        GoRoute(
          path: ProductDetailPage.routeName,
          builder: (context, state) => const ProductDetailPage(),
        ),
        GoRoute(
          path: BasketPage.routeName,
          builder: (context, state) => const BasketPage(),
        ),
        GoRoute(
          path: CheckoutPage.routeName,
          builder: (context, state) => const CheckoutPage(),
        ),
        GoRoute(
          path: FavoritePage.routeName,
          builder: (context, state) => const FavoritePage(),
        ),
        GoRoute(
          path: ProfilePage.routeName,
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
