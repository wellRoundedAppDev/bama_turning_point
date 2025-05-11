import 'dart:convert';
import 'dart:ffi';

import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/cart/data/data_sources/remote_data_sources/cart_apis.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/states.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/locales/locale_cubit/locale_cubit.dart';
import '../../../../shared_components/app_snackbar.dart';
import '../../../data/models/cart_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState()) {
    // LoadCartFromDB();
  }
  LocaleCubit? localeCubit;
  AppSettingsCubit? appSettingsCubit;

  BuildContext context = MyApp.navKey.currentState!.context;
  //CartItems map used to lookup any item in the cart by its ID from any screen
  Map<String, dynamic> cartItems = {};

  //total price of cart
  double totalPrice = 0;

  num numberOfItemsInCart = MyApp.navKey.currentState?.context
          .read<AuthCubit>()
          .loginResponse
          ?.loginData
          ?.cartCountProducts ??
      0;
  String? selectedCartProductId;

  //to call cubit
  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  loadCartItems() async {
    localeCubit = LocaleCubit.get(context);
    appSettingsCubit = AppSettingsCubit.get(context);
    cartItems.clear();

    // emit(LoadCartLoadingState());
    // // if ( AuthCubit.get(context).isUserLoggedIn != true) {
    // //   var success = await AuthCubit.get(context).setAccessToken();
    // //   if(success != true){
    // //     showAppSnackBar(content: AppLocalizations.of(context)!.error_occurred_try_again);
    // //   }
    // //   return;
    // // }
    // var response = await CartApis.getCartItems(
    //     languageCode: languageCodes[localeCubit?.locale.languageCode] ?? "",
    //     currencyCode: appSettingsCubit?.currencyCode ?? "");
    //
    // if (response?.success == 1) {
    //   response?.data?.cartItemsFromApi?.forEach((e) {
    //     if (e.productId != null) {
    //       cartItems[e.productId ?? ""] = {
    //         "id": e.productId,
    //         "name": e.name,
    //         "quantity": int.tryParse(e.quantity ?? ""),
    //         "price": e.priceRaw,
    //         "imagePath": e.thumb,
    //         "cartId": int.tryParse(e.key ?? ""),
    //         "priceFormatted": e.priceFormatted
    //       };
    //       // totalPrice + (double.tryParse(e.price?.replaceAll("\$", "") ?? "")??0 *
    //       // (int.tryParse(e.quantity ?? "")??0));
    //     }
    //   });
    //   // totalPrice = (cartItems.isNotEmpty == true)?cartItems.entries
    //   //     .map((e) => (double.tryParse(e.value['priceFormatted'].toString().replaceAll("\$", "").replaceAll("IQD", "")??"")??0 )* e.value['quantity'])
    //   //     .toList()
    //   //     .reduce((value, element) => value + element).toDouble():0;
    //   totalPrice = response?.data?.totalRaw?.toDouble() ?? 0;
    //   emit(LoadCartSuccessState());
    // } else if (response?.success == 0) {
    //   emit(LoadCartFailedState());
    // } else {
    //   emit(LoadCartNetworkConnectionFailedState());
    // }
  }

  isItemInCart(String id) {
    return cartItems[id] != null;
  }

  Future<bool?> addItemsToCart() async {
    var items = cartItems.entries
        .map((e) => {
              "product_id": e.key,
              "quantity": e.value['quantity'],
              "option": e.value?['option'] ?? {}
            })
        .toList();
    var response = await CartApis.addItemsToCart(items);
    return response;
  }

  addItemToCart(CartItem cartItem, {bool saveInDB = true}) async {
    // bool? isUserLoggedIn =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    // String? accessToken =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    // if (isUserLoggedIn == false && accessToken == null) {
    //   var success = await AuthCubit.get(context).setAccessToken();
    //   if (!success) {
    //     emit(ItemAddedToCartNetworkConnectionFailedState());
    //     return;
    //   }
    // }
    // emit(ItemAddedToCartLoadingState());
    // var response = await CartApis.addItemToCart({
    //   "product_id": cartItem.productId,
    //   "quantity": 1,
    //   "option": cartItem.option?['option'] ?? {}
    // });
    // if (response?.success == false) {
    //   emit(ItemAddedToCartFailedState());
    //   showAppSnackBar(content: response?.errorMsgs?[0]);
    //   return false;
    // } else if (response?.success == null) {
    //   emit(ItemAddedToCartNetworkConnectionFailedState());
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   return null;
    // }

    String id = cartItem.productId;
    bool isItemNotInCart = cartItems[id] == null;
    if (isItemNotInCart) {
      cartItems[id] = cartItem.toJson();
      increaseProductQuantity(id, 0, SaveInDB: saveInDB);
      return true;
    }

    if (saveInDB) {
      // SaveCartInDB();
    }
  }

  deleteProductFromSalesCart(String id, int cartId) async {
    selectedCartProductId = id;
    // emit(ItemDeletedFromCartLoadingState());
    // bool? isUserLoggedIn =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    // String? accessToken =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    // if (isUserLoggedIn == false && accessToken == null) {
    //   var success = await AuthCubit.get(context).setAccessToken();
    //   if (!success) {
    //     showAppSnackBar(
    //         content: "Check your internet connection, and try again");
    //     emit(ItemDeletedFromCartNetworkConnectionFailedState());
    //     return;
    //   }
    // }
    // var success = await CartApis.deleteCartItem(cartId);
    // if (success == false) {
    //   emit(ItemDeletedFromCartFailedState());
    //   showAppSnackBar(content: "Error occured");
    //   return false;
    // } else if (success == null) {
    //   emit(ItemDeletedFromCartNetworkConnectionFailedState());
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   return null;
    // }

    int quantity = cartItems[id]["quantity"];
    double? price = double.tryParse(cartItems[id]["price"]?.toString() ?? "");

    totalPrice = totalPrice - (quantity * (price ?? 0));
    cartItems.removeWhere((key, value) => key == id);
    numberOfItemsInCart = numberOfItemsInCart - quantity;
    // SaveCartInDB();
    emit(ItemDeletedFromCartSuccessState());
  }

  increaseProductQuantity(String id, int cartId, {bool SaveInDB = true}) async {
    // if (state is UpdateCartItemQuantityLoadingState) {
    //   return;
    // }
    // emit(UpdateCartItemQuantityLoadingState());
    // bool? isUserLoggedIn =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    // String? accessToken =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    // if (isUserLoggedIn == false && accessToken == null) {
    //   var success = await AuthCubit.get(context).setAccessToken();
    //   if (!success) {
    //     showAppSnackBar(
    //         content: "Check your internet connection, and try again");
    //     emit(UpdateCartItemQuantityNetworkConnectionFailedState());
    //     return;
    //   }
    // }
    // var success = await CartApis.updateCartItemQuantity(
    //     cartId, cartItems[id]['quantity'] + 1);
    // if (success == false) {
    //   emit(UpdateCartItemQuantityFailedState());
    //   showAppSnackBar(content: "Error occurred");
    //   return false;
    // } else if (success == null) {
    //   emit(UpdateCartItemQuantityNetworkConnectionFailedState());
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   return null;
    // }
    //
    //String id = selectedProduct?["id"]??"";
    cartItems[id]['quantity'] = cartItems[id]['quantity'] + 1;
    numberOfItemsInCart = numberOfItemsInCart + 1;

    double price = cartItems[id]['price']?.toDouble();

    totalPrice = totalPrice + price;
    if (SaveInDB) {
      // SaveCartInDB();
    }
    emit(ItemQuantityIncreasedInCartState());
  }

  //
  decreaseProductQuantity(String id, int cartId) async {
    // if (state is UpdateCartItemQuantityLoadingState || quantity == 1) {
    //   return;
    // }
    //
    // emit(UpdateCartItemQuantityLoadingState());
    // bool? isUserLoggedIn =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    // String? accessToken =
    //     MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
    // if (isUserLoggedIn == false && accessToken == null) {
    //   var success = await AuthCubit.get(context).setAccessToken();
    //   if (!success) {
    //     showAppSnackBar(
    //         content: "Check your internet connection, and try again");
    //     emit(UpdateCartItemQuantityNetworkConnectionFailedState());
    //     return;
    //   }
    // }
    // var success = await CartApis.updateCartItemQuantity(
    //     cartId, cartItems[id]['quantity'] - 1);
    // if (success == false) {
    //   emit(UpdateCartItemQuantityFailedState());
    //   showAppSnackBar(content: "Error occurred");
    //   return false;
    // } else if (success == null) {
    //   emit(UpdateCartItemQuantityNetworkConnectionFailedState());
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   return null;
    // }

    // String id = selectedProduct?["id"]??"";

    // if (Quantity == 1) {
    //   // context.read<CategoriesAndProductsProvider>().setSelectedProduct(Product(name: name, id: id, price: price,imagePath: imagePath,quantity: quantity));
    //
    //   return;
    // }

    int quantity = cartItems[id]['quantity'];
    double price = cartItems[id]['price']?.toDouble();

    cartItems[id]['quantity'] = quantity - 1;
    numberOfItemsInCart = numberOfItemsInCart - 1;

    // context.read<CategoriesAndProductsProvider>().setSelectedProduct(Product(name: name, id: id, price: price,imagePath: imagePath,quantity: quantity));

    totalPrice = totalPrice - price;

    // SaveCartInDB();
    emit(ItemQuantityDecreasedFromCartState());
  }

  clearCart() {
    cartItems.clear();
    totalPrice = 0;
    numberOfItemsInCart = 0;
    // SaveCartInDB();
    emit(CartIsClearedState());
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
