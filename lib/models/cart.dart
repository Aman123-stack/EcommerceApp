
import 'package:testapp/core/store.dart';
import 'package:testapp/models/catalog.dart';
import 'package:testapp/pages/cart_page.dart';
import 'package:velocity_x/velocity_x.dart';
class CartModel {

  // catalog field
   late Catalogmodel _catalog;


  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  Catalogmodel get catalog => _catalog;

  set catalog(Catalogmodel newCatalog)  {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item



}
class AddMutation extends VxMutation<MyStore>{
   final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore>{
  late final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }

}