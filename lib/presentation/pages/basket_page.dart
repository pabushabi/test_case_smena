import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocs/basket/basket_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
            state.basket.itemsCount,
            (index) => Text(state.basket.items[index].name),
          ),
        );
      },
    );
  }
}
