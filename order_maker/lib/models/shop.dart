import 'package:flutter/material.dart';
import 'package:order_maker/models/drink.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class BubbleTeaShop extends ChangeNotifier {
  // List of drinks for sale
  final List<Drink> _drinks = [
    Drink(
      name: "Pearl Milk Tea",
      price: "4.00",
      imagePath: "lib/images/milk_tea.jpg",
    )
  ];

  // List of drinks in user cart
  final List<Drink> _userCart = [];

  List<Drink> get shop => _drinks;

  List<Drink> get cart => _userCart;

  void addDrink(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  void removeDrink(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}

final bubbleTeaChangeNotiProvider =
    ChangeNotifierProvider((ref) => BubbleTeaShop());
