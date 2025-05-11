import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishListCubit extends Cubit<WishListStates> {
  WishListCubit() : super(WishListInitialState());

  static WishListCubit get(context) => BlocProvider.of(context);
  LocaleCubit? localeCubit;
  AppSettingsCubit? appSettingsCubit;
  BuildContext context = MyApp.navKey.currentState!.context;

  List<WishlistItem>? wishListItems;
  int? selectedProductId;
  CartCubit? cartCubit;

  init(CartCubit cartCubit) {
    localeCubit = LocaleCubit.get(context);
    appSettingsCubit = AppSettingsCubit.get(context);
    this.cartCubit = cartCubit;

    setWishListItems();
  }

  setWishListItems() async {
    emit(GetWishListLoadingState());
    var response = await WishListApis.getWishlist(
        languageCode:
            languageCodes[LocaleCubit.get(context).locale.languageCode],
        currencyCode: appSettingsCubit?.currencyCode ?? "");
    if (response?.isSuccssed == true) {
      wishListItems = response?.obj?.products?.map((e) {

            return WishlistItem(
                productId: e?.brandId?.toString(),
                name: e?.brandName,
                sourceId: e?.source?.toInt(),
                thumb:

                e?.files == null || e?.files?.isEmpty == true? null:
                (ApiUrls.BASE_URL +
                    (e?.files?.first?.fileUrl?.replaceFirst("\\", "") ?? "")));
          })?.toList() ??
          [];

      emit(GetWishListSuccessState());
    } else if (response?.isSuccssed == false) {
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

  deleteItemFromWishList(int? productId, int? sourceId) async {
    setSelectedProductId(productId);
    if (productId == null) {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.error_occurred_try_again);
      return;
    }
    emit(DeleteItemFromWishListLoadingState());
    var response = await WishListApis.deleteItemFromWishlist(
        productId, sourceId?.toInt() ?? 0);
    if (response?.success == true) {
      showAppSnackBar(content: "Product removed from wishlist");
      setWishListItems();
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.message ?? "");
      emit(DeleteItemFromWishListFailedState());
    } else {
      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);
      emit(DeleteItemFromWishListNetworkConnectionFailedState());
    }
  }

  addItemToWishlist(int productId, int productType) async {
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
    var response = await WishListApis.addItemToWishlist(productId, productType);
    if (response?.success == true) {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.product_added_to_favorites);
      wishListItems?.add(WishlistItem(productId: productId?.toString()));
      emit(AddItemToFavoritesSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.message ?? "");

      emit(AddItemToFavoritesFailedState());
    } else {
      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);
      emit(AddItemToFavoritesNetworkConnectionFailedState());
    }
  }
}
