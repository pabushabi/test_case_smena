import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/models/product.dart';
import 'package:test_case_smena/core/repos/basket_repository.dart';

import '../../models/basket.dart';

part 'basket_event.dart';

part 'basket_state.dart';

part 'basket_bloc.freezed.dart';

@injectable
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  late final Basket basket;
  final BasketRepository basketRepo;

  BasketBloc({
    required this.basketRepo,
  }) : super(const BasketState.empty()) {
    on<BasketEvent>((event, emit) async {
      await event.map(
        basketRequested: (_) async {
          emit(const BasketState.loading());
          if (await basketRepo.isBasketSaved()) {
            basket = await basketRepo.restoreBasket();
          } else {
            basket = Basket.empty();
          }
          if (basket.items.isEmpty) {
            emit(const BasketState.empty());
          } else {
            emit(BasketState.filled(basket: basket));
          }
        },
        productAdded: (_) async {
          emit(const BasketState.loading());
          basket.addItem(_.product);
          await basketRepo.saveBasket(basket);
          emit(BasketState.filled(basket: basket));
        },
        productRemoved: (_) async {
          emit(const BasketState.loading());
          basket.removeItem(_.product);
          await basketRepo.saveBasket(basket);
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
