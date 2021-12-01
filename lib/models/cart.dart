import 'package:testapp/models/catalog.dart';

class Cartmodel{
  static final cartmodel= Cartmodel._internal();
  Cartmodel._internal();
  factory Cartmodel()=> cartmodel;
  late Catalogmodel _catlog;
  final List<int> _itemids = [];

  Catalogmodel get catlog => _catlog;
  set catlog(Catalogmodel newcatlog){
    newcatlog = _catlog;
  }

  List<Item> get items => _itemids.map((id)=> _catlog.getById(id)).toList();

  num get totalPrice=>
      items.fold(0,(total,current)=>total+current.price);


  void add(Item item){
    _itemids.add(item.id);
  }
  
  void remove(Item item){
    _itemids.remove(item.id);
  }

}