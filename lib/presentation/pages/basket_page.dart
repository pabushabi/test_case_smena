import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_case_smena/config/injection.dart';
import 'package:test_case_smena/presentation/widgets/basket_item_widget.dart';

import '../../core/blocs/basket/basket_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return Column(
          children: List.generate(
            state.basket.itemsCount,
            (index) => BasketItemWidget(product: state.basket.items[index]),
          ),
        );
      },
    );
  }
}
