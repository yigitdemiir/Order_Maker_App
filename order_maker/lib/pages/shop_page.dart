import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_maker/components/drink_tile.dart';
import 'package:order_maker/models/drink.dart';
import 'package:order_maker/models/shop.dart';
import 'package:order_maker/pages/order_page.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  void goToOrderPage(Drink drink) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(
            drink: drink,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var value = ref.watch(bubbleTeaChangeNotiProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              "Bubble Tea Shop",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Drink currentDrink = value.shop[index];

                  return DrinkTile(
                    drink: currentDrink,
                    onTap: () => goToOrderPage(currentDrink),
                    trailing: const Icon(Icons.arrow_forward),
                  );
                },
                itemCount: value.shop.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
