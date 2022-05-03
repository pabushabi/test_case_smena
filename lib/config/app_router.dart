import 'package:auto_route/auto_route.dart';
import 'package:test_case_smena/presentation/pages/basket_page.dart';
import 'package:test_case_smena/presentation/pages/category_page.dart';
import 'package:test_case_smena/presentation/pages/home.dart';
import 'package:test_case_smena/presentation/pages/menu_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    AutoRoute(
      path: '/',
      page: Home,
      children: [
        AutoRoute(
          path: "menu",
          name: "MenuRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: MenuPage,
              initial: true,
            ),
            AutoRoute(
              path: ":category",
              page: CategoryPage,
            ),
          ],
        ),
        AutoRoute(
          path: "basket",
          name: "BasketRouter",
          page: BasketPage,
        ),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
