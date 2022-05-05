part of 'basket_bloc.dart';

@freezed
class BasketState with _$BasketState {
  const factory BasketState.empty() = _Empty;
  const factory BasketState.loading() = _Loading;
  const factory BasketState.filled({required Basket basket}) = _Filled;
}
