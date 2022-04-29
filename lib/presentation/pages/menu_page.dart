import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_case_smena/core/blocs/app/app_bloc.dart';

import '../../config/app_router.gr.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return state.map(
          initial: (_) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loadSuccessful: (state) {
            final menu = state.data.menu;
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                menu.length,
                (index) => GestureDetector(
                  child: Text(menu[index].categoryName),
                  onTap: () =>
                      context.router.push(CategoryRoute(category: menu[index])),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
