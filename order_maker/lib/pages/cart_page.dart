import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_maker/components/drink_tile.dart';
import 'package:order_maker/models/drink.dart';
import 'package:order_maker/models/shop.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    var value = ref.watch(bubbleTeaChangeNotiProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Drink drink = value.cart[index];

                  return DrinkTile(
                    drink: drink,
                    trailing: const Icon(Icons.delete),
                    onTap: () => removeFromCart(drink),
                  );
                },
                itemCount: value.cart.length,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Pay"))
          ],
        ),
      ),
    );
  }

  void removeFromCart(Drink drink) {
    ref.watch(bubbleTeaChangeNotiProvider).removeDrink(drink);
  }
}
