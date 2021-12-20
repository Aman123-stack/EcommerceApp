import 'package:flutter/material.dart';
import 'package:testapp/core/store.dart';
import 'package:testapp/models/cart.dart';
import 'package:testapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
            title: Text(
              "Cart",
              style: TextStyle(fontSize: 32,color: Theme.of(context).accentColor),),
          ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _cartListState(),
            ),
          ),
          Divider(),
          _cartTotal(),
        ],
      ),


    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
          notifications: {},
          mutations:{RemoveMutation},
        builder: (BuildContext context,store,VxStatus? status){
          return "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make();
        },



          ),
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Buying not supporting yet")));
              },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor)
                    ),
                  child: Text("Buy",style: TextStyle(color: Colors.white),)),


        ],
      ),
    );
  }
}
class _cartListState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
     return _cart.items.isEmpty?Text("Nothing to show",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,),):ListView.builder(
      itemCount: _cart.items.length,
        itemBuilder:(context,index)=>ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: (){
              RemoveMutation(_cart.items[index]);
            },
          ),
          title: Text(_cart.items[index].name),
        ));

  }
}

