import 'dart:convert';

import 'package:classic_eccomerce/cart/data/data_sources/remote_data_sources/cart_apis.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_item.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState()) {
    // LoadCartFromDB();
  }

  //CartItems map used to lookup any item in the cart by its ID from any screen
  Map<String, dynamic> cartItems = {};

  //total price of cart
  double totalPrice = 0;


  int numberOfItemsInCart = 0;
  TabController? tabController;

  //to call cubit
  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  Future<bool?> addItemsToCart() async{
    var items = cartItems.entries.map((e) => {
        "product_id": e.key,
        "quantity": e.value['quantity']
      }).toList();
    var response = await CartApis.addItemsToCart(items);
    return response;
  }

  addItemToCart(CartItem cartItem, {bool saveInDB = true}) {
    String id = cartItem.id;
    bool isItemNotInCart = cartItems[id] == null;
    if (isItemNotInCart) {
      cartItems[id] = cartItem.toJson();

      emit(ItemAddedToCartState());
      increaseProductQuantity(id, SaveInDB: saveInDB);
    }

    if (saveInDB) {
      // SaveCartInDB();
    }
  }

  deleteProductFromSalesCart(String Id) {
    int Quantity = cartItems[Id]["quantity"];
    double Price = cartItems[Id]["price"];

    totalPrice = totalPrice - (Quantity * Price);
    cartItems.removeWhere((key, value) => key == Id);
    // SaveCartInDB();
    emit(ItemDeletedFromCartState());
  }

  increaseProductQuantity(String Id, {bool SaveInDB = true}) {
    //String id = selectedProduct?["id"]??"";
    cartItems[Id]['quantity'] = cartItems[Id]['quantity'] + 1;

    double Price = cartItems[Id]['price'];

    totalPrice = totalPrice + Price;
    if (SaveInDB) {
      // SaveCartInDB();
    }
    emit(ItemQuantityIncreasedInCartState());
  }

  //
  decreaseProductQuantity(String Id) {
    // String id = selectedProduct?["id"]??"";
    int Quantity = cartItems[Id]['quantity'];
    double Price = cartItems[Id]['price'];
    String Name = cartItems[Id]['name'];
    String ImagePath = cartItems[Id]['imagePath'];

    if (Quantity == 1) {
      // context.read<CategoriesAndProductsProvider>().setSelectedProduct(Product(name: name, id: id, price: price,imagePath: imagePath,quantity: quantity));

      return;
    }
    cartItems[Id]['quantity'] = Quantity - 1;

    // context.read<CategoriesAndProductsProvider>().setSelectedProduct(Product(name: name, id: id, price: price,imagePath: imagePath,quantity: quantity));

    totalPrice = totalPrice - Price;

    // SaveCartInDB();
    emit(ItemQuantityDecreasedFromCartState());
  }

  clearSalesCart() {
    cartItems.clear();
    totalPrice = 0;
    numberOfItemsInCart = 0;
    // SaveCartInDB();
    emit(CartIsClearedState());
  }

  initCheckOut(TickerProvider tickerProvider){
    tabController =
        TabController(initialIndex: 0, length: 3, vsync: tickerProvider);
    // tabController?.addListener(() {
    //   print(tabController?.index);
    //   if (tabController?.index == 1) {
    //     setMyAds();
    //     // context.read<TransactionsProvider>().getLastTenTransactions();
    //   }
    // });

  }
  // this is used to store a cart info in the database. so that when the user
  // exists the app the data presists.
  // SaveCartInDB() async {
  //   // delete all the rows in the cart table, then insert the new rows one by one.
  //   // notice that this must be done in a transaction to avoid any problems.
  //   bool result = true;
  //   await DatabaseManagement.StoreDB!.transaction((txn) async {
  //     await txn.rawDelete("delete from cart");
  //     for (int i = 0; i < cartItems.length; i++) {
  //       var itm = cartItems.values.elementAt(i);
  //       int id = i;
  //       int item_id = int.parse(itm['id']);
  //       String item_name = itm['name'];
  //       double item_price = itm['price'];
  //       String item_image = itm['imagePath'];
  //       int item_count = itm['quantity'];
  //
  //       await txn.rawInsert(
  //           "insert into cart(id,item_id,item_name,item_price,item_image,item_count) values(?,?,?,?,?,?)",
  //           [id, item_id, item_name, item_price, item_image, item_count]);
  //     }
  //   }).onError((error, stackTrace) {
  //     result = false;
  //     if (kDebugMode) {
  //       print("Error while saving cart in database: $error");
  //     }
  //   });
  //   return result;
  // }

  // this is called when setting the state of the cart thus loading the old cart
  // from the database.
  // LoadCartFromDB() {
  //   DatabaseManagement.StoreDB!.rawQuery("select * from cart").then((value) {
  //     totalPrice = 0;
  //     numberOfItemsInCart = 0;
  //
  //     for (int i = 0; i < value.length; i++) {
  //       String item_id = value[i]["item_id"].toString();
  //       String item_name = value[i]["item_name"] as String;
  //       double item_price = value[i]["item_price"] as double;
  //       String item_image = value[i]["item_image"] as String;
  //       int item_count = value[i]["item_count"] as int;
  //
  //       var ci = CartItem(
  //           Id: item_id,
  //           Name: item_name,
  //           Price: item_price,
  //           ImagePath: item_image,
  //           Quantity: item_count - 1);
  //
  //       addItemToSalesCart(ci, SaveInDB: false);
  //     }
  //   }).onError((error, stackTrace) {
  //     if (kDebugMode) {
  //       print("Error while saving cart in database: $error");
  //     }
  //   });
  // }
}
