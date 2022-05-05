import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/product.dart';

import '../../models/basket.dart';

part 'basket_event.dart';

part 'basket_state.dart';

part 'basket_bloc.freezed.dart';

@injectable
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final Basket basket;

  BasketBloc(this.basket) : super(const BasketState.empty()) {
    on<BasketEvent>((event, emit) {
      event.map(
        basketRequested: (_) {
          emit(const BasketState.loading());
          if (basket.items.isEmpty) {
            emit(const BasketState.empty());
          } else {
            emit(BasketState.filled(basket: basket));
          }
        },
        productAdded: (_) {
          emit(const BasketState.loading());
          basket.addItem(_.product);
          emit(BasketState.filled(basket: basket));
        },
        productRemoved: (_) {
          emit(const BasketState.loading());
          basket.removeItem(_.product);
          if (basket.items.isEmpty) {
            emit(const BasketState.empty());
          } else {
            emit(BasketState.filled(basket: basket));
          }
        },
      );
    });
  }
}
