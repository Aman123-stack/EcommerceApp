import 'package:flutter/material.dart';
import 'package:testapp/models/cart.dart';
import 'package:testapp/widgets/themes.dart';
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
              padding: const EdgeInsets.all(32.0),
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
    final _cart = cartmodel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${_cart.totalPrice}",style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).accentColor,
          ),
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
class _cartListState extends StatefulWidget {
  const _cartListState({Key? key}) : super(key: key);

  @override
  _cartListStateState createState() => _cartListStateState();
}

class _cartListStateState extends State<_cartListState> {
  final _cart = cartmodel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
        itemBuilder:(context,index)=>ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: (){},
          ),
          title: Text(_cart.items[index].name),
        ));
  }
}

