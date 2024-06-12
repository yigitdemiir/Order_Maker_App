import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_maker/models/drink.dart';
import 'package:order_maker/models/shop.dart';

class OrderPage extends ConsumerStatefulWidget {
  final Drink drink;

  const OrderPage({super.key, required this.drink});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  void addToCart() {
    ref.watch(bubbleTeaChangeNotiProvider.notifier).addDrink(widget.drink);

    Navigator.pop(context);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Successfully added to cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      backgroundColor: Colors.brown[200],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(widget.drink.imagePath),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text("Sweet"),
                      ),
                      Expanded(
                        child: Slider(
                          value: sweetValue,
                          onChanged: (value) => customizeSweet(value),
                          divisions: 4,
                          label: sweetValue.toString(),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text("Ice"),
                      ),
                      Expanded(
                        child: Slider(
                          value: iceValue,
                          onChanged: (value) => customizeIce(value),
                          divisions: 4,
                          label: iceValue.toString(),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text("Pearl"),
                      ),
                      Expanded(
                        child: Slider(
                          value: pearlValue,
                          onChanged: (value) => customizePearl(value),
                          divisions: 4,
                          label: pearlValue.toString(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: addToCart,
              child: const Text("Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}
