// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nikestore/data/cart.dart';
import 'package:nikestore/data/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {

  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Shoe> shoes = [];

  Cart Cartdb = Cart();
  final _myBox = Hive.box('myBox');
  
  // @override
  // void initState(){
  //   if(_myBox.get("Cart") == null){
  //     Cartdb.createInitialData();
  //   } else {
  //     Cartdb.loadCart();
  //   }
  //   super.initState();
  // }

  void _getShoes(){
    shoes = Shoe.getShoes();
  }

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen:false).addItemToCart(shoe);
    showDialog(context: context, builder: (context)  => AlertDialog(
      title: Text('Successfully Added'),
      content: Text('${shoe.name} has been added successfully, Check your cart'),
    ));
    Cartdb.updateCart();
  }

  void removeShoeFromCart(Shoe shoe){
    Provider.of<Cart>(context, listen:false).removeItemFromCart(shoe);
    showDialog(context: context, builder: (context)  => AlertDialog(
      title: Text('Removed Successfully'),
      content: Text('${shoe.name} has been removed successfully!'),
    ));
    Cartdb.updateCart();
  }

  @override
  Widget build(BuildContext context) {
    _getShoes();
    return Column(
      // search bar
      children: [
        Container(
          margin: EdgeInsets.all(27), 
          child: TextField( 
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left:20),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.search, color: Colors.grey,), 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              ), 
              hintText: "Search",
              hintStyle:TextStyle(color: Colors.grey)
            )
          )
        ),
    
        // message
        Center(child: Text("everyone flies..some fly longer than others", style: TextStyle(color:Colors.grey, fontSize: 16),),),
        
        SizedBox(height: 30,),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('Hot Picks 🔥', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)
            ],
          ),
        ),
    
        SizedBox(height: 10,),
        
        
        // hot picks
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                // height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children : [
                    Image.asset(shoes[index].imagePath, width: 250, height: 250,),
    
                    Column(
                      children: [
                        Text(shoes[index].name, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                        
                        Text(shoes[index].description, style: TextStyle(color: Colors.grey[600], fontSize: 16),),
                      ],
                    ),
                  Consumer<Cart>(
                    builder: (context, value, child) {
                    return Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                          child: IconButton(icon: Icon(Icons.add), onPressed: () => addShoeToCart(shoes[index]), color: Colors.white,),
                        )
                      ],
                    );
                    }
                  )                
                  ]
                ),
                
              );
            }, 
            separatorBuilder: (context, builder) => SizedBox(width: 0), 
            itemCount: shoes.length
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(),
        )
      ],
    ); 
  }
}