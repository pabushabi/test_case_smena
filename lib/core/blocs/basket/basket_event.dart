part of 'basket_bloc.dart';

@freezed
class BasketEvent with _$BasketEvent {
  const factory BasketEvent.basketRequested() = _BasketRequested;
  const factory BasketEvent.productAdded(Product product) = _ProductAdded;
  const factory BasketEvent.productRemoved(Product product) = _ProductRemoved;
}
