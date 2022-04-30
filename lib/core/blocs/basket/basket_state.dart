part of 'basket_bloc.dart';

@freezed
class BasketState with _$BasketState {
  const factory BasketState({
    required List<Product> products,
    required int total,
  }) = _BasketState;
}
