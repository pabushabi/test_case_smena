import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_case_smena/presentation/widgets/basket_item_widget.dart';

import '../../core/blocs/basket/basket_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return state.map(
          empty: (state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Тут пусто..."),
                  TextButton(
                      onPressed: () {
                        context.router.pushNamed("/menu");
                      },
                      child: const Text("Полистать меню"))
                ],
              ),
            );
          },
          loading: (_) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          filled: (state) {
            final items = state.basket.items;
            return Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 50),
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return BasketItemWidget(
                      product: items[index],
                      onTapDelete: () {
                        context
                            .read<BasketBloc>()
                            .add(BasketEvent.productRemoved(items[index]));
                      },
                    );
                  },
                ),
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(-3, 0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            "Итого ${state.basket.itemsCount} товаров на сумму ${state.basket.totalPrice} ₽"),
                        TextButton(
                            onPressed: () {}, child: const Text("Оформить"))
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
