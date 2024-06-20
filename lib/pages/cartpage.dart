import 'package:flutter/material.dart';
import 'package:nikestore/components/cartItem.dart';
import 'package:nikestore/data/cart.dart';
import 'package:nikestore/data/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index){
                  Shoe individualShoe = value.getCart()[index];
                  return CartItem(shoe: individualShoe);
                },
                itemCount: value.getCart().length,
              )
            )
          ],
        ),
      )
    );
  }
}