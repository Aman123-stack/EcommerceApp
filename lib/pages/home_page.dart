import 'dart:collection';
import 'dart:convert';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/models/cart.dart';
import 'package:testapp/models/catalog.dart';
import 'package:testapp/utils/routes.dart';
import 'package:testapp/widgets/drawer.dart';
import 'package:testapp/widgets/home_widgets/catalog_list.dart';
import 'package:testapp/widgets/item_widget.dart';
import 'package:testapp/widgets/themes.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   @override
   void initState(){
     super.initState();
     loadData();
   }
   loadData() async{
     await Future.delayed(Duration(seconds: 2));
     final catlogjson = await rootBundle.loadString("assets/files/catlog.json");
     var decodedData = jsonDecode(catlogjson);
     var productData = decodedData["products"];
     Catalogmodel.items= List.from(productData).map<Item>((item) => Item.fromJson(item)).toList();
    setState(() {});

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor:Mytheme.bluish,
        child: Icon(CupertinoIcons.cart),

      ),
      backgroundColor: Theme.of(context).canvasColor,
        body:SafeArea(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HermitLabs App",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                      "Trending App",
                  style: TextStyle(
                    fontSize: 16,
                    color:Theme.of(context).accentColor
                  ),
                  ),
                  if(Catalogmodel.items!=null && Catalogmodel.items.isNotEmpty)
                    
                    Expanded(child: CatlogList())

                  else
                       Expanded(
                          child: Center(child: CircularProgressIndicator())),

                ],
            ),
          ),
        )
    );
  }
}

class CatlogItem extends StatelessWidget {
  final Item catlog;
  const CatlogItem({Key? key,required this.catlog}) : assert(catlog!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            child: Row(
              children:[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child:  Container(
                    child: Hero(
                      tag: Key(catlog.id.toString()),
                        child: Image.network(catlog.image),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Mytheme.creamColor

          ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      catlog.name,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 5,),
                    Text(catlog.desc,style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10
                    ),
                    ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                           Text("\$${catlog.price}",style: TextStyle(fontWeight: FontWeight.bold),
                           ),
                          _AddToCart(catlog: catlog)
                        ],
                      ),

                  ],
                )
          )
              ],
            ),
            height: 150,
            width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).cardColor
          ),
      
        ),
    );
  }
  
}
class _AddToCart extends StatefulWidget {
  final Item catlog;
  const _AddToCart({Key? key, required this.catlog}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      isAdded=true;
      final _catlog = Catalogmodel();
      final _cart = Cartmodel();
      _cart.catlog = _catlog;
      _cart.add(widget.catlog);
      setState(() {});
    },
      style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
    ), child: isAdded?Icon(Icons.done):Text("Buy"),
    );
  }
}










