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
      initial: true,
      children: [
        AutoRoute(page: MenuPage),
        AutoRoute(page: BasketPage),
        // AutoRoute(page: CategoryPage),
      ],
    ),
    AutoRoute(page: CategoryPage),
  ],
)
class $AppRouter {}
