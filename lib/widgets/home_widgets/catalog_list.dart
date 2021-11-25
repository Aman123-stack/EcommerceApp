import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/models/catalog.dart';
import 'package:testapp/pages/home_detail_page.dart';
import 'package:testapp/pages/home_page.dart';


class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: Catalogmodel.items.length,
        itemBuilder: (context,index){
          final catlog = Catalogmodel.items[index];
          return InkWell(
            onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailsPage(catlog: catlog))),
              child: CatlogItem(catlog: catlog));
        }
        );


  }
}