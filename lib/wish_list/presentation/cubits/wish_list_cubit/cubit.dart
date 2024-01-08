import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/wish_list/data/data_sources/remote_data_sources/wish_list_apis.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../shared_components/app_snackbar.dart';
import '../../../data/models/get_wishlist_response.dart';

class WishListCubit extends Cubit<WishListStates> {
  WishListCubit() : super(WishListInitialState());

  static WishListCubit get(context) => BlocProvider.of(context);
  LocaleCubit? localeCubit;
  AppSettingsCubit? appSettingsCubit;
  BuildContext context = MyApp.navKey.currentState!.context;

  List<WishlistItem>? wishListItems;
  int? selectedProductId;
  CartCubit? cartCubit;

  init(CartCubit cartCubit)
    {
      localeCubit = LocaleCubit.get(context);
      appSettingsCubit = AppSettingsCubit.get(context);
      this.cartCubit = cartCubit;

      setWishListItems();
    }

  setWishListItems() async {

    emit(GetWishListLoadingState());
    var response = await WishListApis.getWishlist(
        languageCode: languageCodes[LocaleCubit.get(context).locale.languageCode]
        ,currencyCode: appSettingsCubit?.currencyCode??""
    );
    if (response?.success == 1) {
      wishListItems = response?.wishListItems;

      emit(GetWishListSuccessState());
    } else if (response?.success == 0) {
      wishListItems = null;
      emit(GetWishListFailedState());
    } else {
      wishListItems = null;
      emit(GetWishListNetworkConnectionFailedState());
    }
  }

  setSelectedProductId(int? productId) {
    selectedProductId = productId;
  }

  // addItemToCart(WishlistItem? wishlistItem) {
  //   setSelectedProductId(int.tryParse(wishlistItem?.productId ?? ""));
  //   if (wishlistItem?.productId == null) {
  //     showAppSnackBar(content: "Error occured");
  //     return;
  //   }
  //
  //   emit(ItemAddedToCartFromWishListLoadingState());
  //   var success = cartCubit?.addItemToCart(CartItem(
  //       id: wishlistItem?.productId ?? "",
  //       name: wishlistItem?.name ?? "",
  //       price: double.tryParse(wishlistItem?.price ?? "") ?? 0));
  //   if (success == true) {
  //     showAppSnackBar(content: "Product removed from wishlist");
  //     emit(ItemAddedToCartSuccessState());
  //   } else if (success == false) {
  //     showAppSnackBar(content: "Error occured");
  //     emit(ItemAddedToCartFailedState());
  //   } else {
  //     showAppSnackBar(content: "Check your internet connection, and try again");
  //     emit(ItemAddedToCartNetworkConnectionFailedState());
  //   }
  // }

  deleteItemFromWishList(int? productId) async {
    setSelectedProductId(productId);
    if (productId == null) {
      showAppSnackBar(content: "Error occured");
      return;
    }
    emit(DeleteItemFromWishListLoadingState());
    var response = await WishListApis.deleteItemFromWishlist(productId);
    if (response == true) {
      showAppSnackBar(content: "Product removed from wishlist");
      setWishListItems();
    } else if (response == false) {
      showAppSnackBar(content: "Error occured");
      emit(DeleteItemFromWishListFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(DeleteItemFromWishListNetworkConnectionFailedState());
    }
  }

  addItemToWishlist(int productId) async {
    bool? isUserLoggedIn =
        MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    if (isUserLoggedIn == false) {
      showAppSnackBar(content: "You must login to add product to wish list");
      return;
    }

    // var success = await AuthCubit.get(context).setAccessToken();
    // if (success == false) {
    //   return;
    // }

    emit(AddItemToFavoritesLoadingState());
    var response = await WishListApis.addItemToWishlist(productId,

    );
    if (response == true) {
      showAppSnackBar(content: "Product added to wishlist");
      emit(AddItemToFavoritesSuccessState());
    } else if (response == false) {
      showAppSnackBar(content: "Error occurred");

      emit(AddItemToFavoritesFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(AddItemToFavoritesNetworkConnectionFailedState());
    }
  }

}
