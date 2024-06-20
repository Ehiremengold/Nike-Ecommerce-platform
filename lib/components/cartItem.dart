import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nikestore/data/cart.dart';
import 'package:nikestore/data/shoe.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, required this.shoe});

  Shoe shoe;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text('\$${widget.shoe.price}'),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: removeShoeFromCart,),
      ),
    );
  }

  void removeShoeFromCart() {
    Provider.of<Cart>(context, listen:false).removeItemFromCart(widget.shoe);
  }
}