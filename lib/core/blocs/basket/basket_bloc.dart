import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/product.dart';

part 'basket_event.dart';

part 'basket_state.dart';

part 'basket_bloc.freezed.dart';

@injectable
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  List<Product> products = [];
  BasketBloc() : super(const BasketState(products: [], total: 0)) {
    on<BasketEvent>((event, emit) async {
      await event.map(
        basketInitialized: (_) {},
        basketRequested: (_) {
          emit(state.copyWith(products: products));
        },
        productAdded: (_) {
          products.add(_.product);
          emit(state.copyWith(products: products));
        },
        productRemoved: (_) {},
      );
    });
  }
}