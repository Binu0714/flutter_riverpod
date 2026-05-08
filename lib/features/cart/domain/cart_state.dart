import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int productId,
    required String title,
    required double price,
    @Default(1) int quantity,
  }) = _CartItem;
}

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
  }) = _CartState;

  const CartState._();
  double get total => items.fold(0, (sum, item) => sum + (item.price * item.quantity));
}