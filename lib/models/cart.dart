
import 'package:testapp/models/catalog.dart';
import 'package:testapp/pages/cart_page.dart';
class CartModel {
  static final cartModel = CartModel._internal(Catalogmodel());

  CartModel._internal(this._catalog);

  factory CartModel() => cartModel;

  // catalog field
   Catalogmodel _catalog;


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

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

}