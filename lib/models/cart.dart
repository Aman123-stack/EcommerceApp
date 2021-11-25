import 'package:testapp/models/catalog.dart';

class cartmodel{
  late Catalogmodel _catlog;

  final List<int> _itemids = [];

  Catalogmodel get catlog => _catlog;
  set catlog(Catalogmodel newcatlog){
    assert(newcatlog!= null);
    _catlog = newcatlog;
  }

  List<Item> get items => _itemids.map((id)=>_catlog.getById(id)).toList();
}