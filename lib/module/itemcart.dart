import 'package:flutter/material.dart';

class cartModel extends ChangeNotifier{

  // list of items on sale
  final List _shopItems =  [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "images/avocado.png", Colors.green],
    ["Banana", "2.50", "images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "images/chicken.png", Colors.brown],
    ["Water", "1.00", "images/water.png", Colors.blue],
    ["Water", "1.00", "images/burgerbig.png", Colors.yellow],

    ["Avocado", "4.00", "images/avocado.png", Colors.green],
    ["Banana", "2.50", "images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "images/chicken.png", Colors.brown],
    ["Water", "1.00", "images/water.png", Colors.blue],
    ["Water", "1.00", "images/burgerbig.png", Colors.yellow],



  ];

  get shopItems => _shopItems;

  ////--cart
   List _CartItem =[];
  get CartItem => _CartItem;
  //---  at to cart
  void addTocart(int index){
    _CartItem.add(_shopItems[index]);
    notifyListeners();
  }
// remove from cart

 void removeFromcart(int index){
    _CartItem.removeAt(index);
        notifyListeners();
 }
  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < CartItem.length; i++) {
      totalPrice += double.parse(CartItem[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}