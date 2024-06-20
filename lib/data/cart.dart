import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nikestore/data/shoe.dart';

class Cart extends ChangeNotifier{
  List cart = [];

  final _myBox = Hive.box('myBox');

  List getCart(){
    return cart;
  }
  
  void createInitialData () {
    cart = [];
  }

  void loadCart(){
    cart = _myBox.get('Cart');
  } 

  void updateCart (){
    _myBox.put("Cart", cart);
  }

  void addItemToCart(Shoe shoe){
    cart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe){
    cart.remove(shoe);
    notifyListeners();
  }
}