import 'package:auto_route/auto_route.dart';
import 'package:test_case_smena/config/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:test_case_smena/config/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_case_smena/core/blocs/basket/basket_bloc.dart';

import '../../config/app_router.gr.dart';
import '../../core/blocs/app/app_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AppBloc>()..add(const AppEvent.dataRequested()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<BasketBloc>()..add(const BasketEvent.basketRequested()),
        ),
      ],
      child: AutoTabsScaffold(
        backgroundColor: Colors.white,
        appBarBuilder: (context, router) {
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 76,
            title: Text(
              router.topRoute.path == ""
                  ? "Столовка"
                  : router.topRoute.path == "basket"
                      ? "Корзина"
                      : "Категория",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: router.topRoute.path != ""
                ? IconButton(
                    onPressed: () {
                      if (router.topRoute.path == "basket") {
                        context.router.pushNamed("/");
                      } else {
                        context.router.navigate(const MenuRoute());
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  )
                : null,
          );
        },
        routes: const [
          MenuRouter(),
          BasketRouter(),
        ],
        bottomNavigationBuilder: (context, router) {
          return BottomNavigationBar(
            currentIndex: router.activeIndex,
            onTap: router.setActiveIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant),
                label: "Меню",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined),
                label: "Корзина",
              ),
            ],
          );
        },
      ),
    );
  }
}
