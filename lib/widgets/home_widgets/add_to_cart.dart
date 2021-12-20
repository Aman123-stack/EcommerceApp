import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/store.dart';
import 'package:testapp/models/cart.dart';
import 'package:testapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddToCart extends StatelessWidget {
  final Item catlog;
   AddToCart({Key? key, required this.catlog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutation,RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    bool isinCart= _cart.items.contains(catlog)??false;
    return ElevatedButton(
      onPressed: (){
      if(!isinCart){
        AddMutation(catlog);
      }

    },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())
      ), child: isinCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}