import 'package:testapp/models/cart.dart';
import 'package:testapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late Catalogmodel catlog;
  late CartModel cart;
  MyStore(){
    catlog=Catalogmodel();
    cart=CartModel();
    cart.catalog=catlog;
  }
}