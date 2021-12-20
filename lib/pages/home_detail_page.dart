import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/models/catalog.dart';
import 'package:testapp/widgets/home_widgets/add_to_cart.dart';
import 'package:testapp/widgets/themes.dart';


class HomeDetailsPage extends StatelessWidget {
  final Item catlog;
  const HomeDetailsPage({Key? key, required this.catlog}) : assert(catlog!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              Text("\$${catlog.price}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 16),
              ),
               AddToCart(catlog: catlog)
            ],
          ),
        ),

      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Hero(
                tag: Key(catlog.id.toString()),
                  child: Image.network(catlog.image)
              ),
            ),
            Expanded(
                  child: Container(
                    width: 500,
                    decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                      MediaQuery.of(context).size.width,100.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            catlog.name.toString(),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                          ),
                          Text(
                            catlog.desc.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                            color: Theme.of(context).accentColor
                          ),
                          ),
                          Text("Electronic device means a device that enables access to or use of an electronic communication service, remote computing service, or location information service. ... Electronic device means a device that is used for audio, video, or text communication or any other type of computer or computer-like instrument.",style: TextStyle(fontWeight: FontWeight.normal,fontSize:16),)
                        ],
                      ),
                    ),


            ),

            )
          ],
        ),
      ),
    );
  }
}
