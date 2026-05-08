import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text("\$${item.price} x ${item.quantity}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () => ref.read(cartProvider.notifier).decrement(item.productId), icon: const Icon(Icons.remove)),
                      IconButton(onPressed: () => ref.read(cartProvider.notifier).increment(item.productId), icon: const Icon(Icons.add)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Total: \$${cart.total.toStringAsFixed(2)}", style: Theme.of(context).textTheme.headlineMedium),
          )
        ],
      ),
    );
  }
}