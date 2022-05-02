import 'package:auto_route/auto_route.dart';
import 'package:test_case_smena/presentation/pages/basket_page.dart';
import 'package:test_case_smena/presentation/pages/category_page.dart';
import 'package:test_case_smena/presentation/pages/home.dart';
import 'package:test_case_smena/presentation/pages/menu_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    AutoRoute(
      page: Home,
      path: "/",
      initial: true,
      children: [
        AutoRoute(
          page: MenuPage,
          path: "menu",
          children: [
            AutoRoute(
              page: CategoryPage,
              path: "menu/category/:name",
            ),
          ],
        ),
        AutoRoute(
          page: BasketPage,
          path: "basket",
        ),
        // AutoRoute(page: CategoryPage),
      ],
    ),
    // AutoRoute(page: CategoryPage),
  ],
)
class $AppRouter {}
