import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/cart_state.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  CartState build() => const CartState();

  void addItem(int id, String title) {
    final existingIndex = state.items.indexWhere((item) => item.productId == id);
    if (existingIndex >= 0) {
      increment(id);
    } else {
      state = state.copyWith(
        items: [...state.items, CartItem(productId: id, title: title, price: 29.99)],
      );
    }
  }

  void increment(int id) {
    state = state.copyWith(
      items: [
        for (final item in state.items)
          if (item.productId == id) item.copyWith(quantity: item.quantity + 1) else item
      ],
    );
  }

  void decrement(int id) {
    final item = state.items.firstWhere((i) => i.productId == id);
    if (item.quantity == 1) {
      state = state.copyWith(items: state.items.where((i) => i.productId != id).toList());
    } else {
      state = state.copyWith(
        items: [
          for (final i in state.items)
            if (i.productId == id) i.copyWith(quantity: i.quantity - 1) else i
        ],
      );
    }
  }
}