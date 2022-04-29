import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_case_smena/core/blocs/app/app_bloc.dart';
import 'package:test_case_smena/presentation/widgets/category_widget.dart';

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
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                menu.length,
                (index) => CategoryWidget(
                  category: menu[index],
                  onTap: () => context.router.push(
                    CategoryRoute(category: menu[index]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
