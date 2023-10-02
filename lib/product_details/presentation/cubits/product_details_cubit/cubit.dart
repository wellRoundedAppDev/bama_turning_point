import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/product_details/data/data_sources/remote_data_sources/product_details_api.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/states.dart';
import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
import 'package:classic_eccomerce/wish_list/data/data_sources/remote_data_sources/wish_list_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  int selectedProductId;
  BuildContext context = MyApp.navKey.currentState!.context;
  ProductDetailsCubit({required this.selectedProductId})
      : super(ProductDetailsInitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetails? selectedProductDetails;
  int slideCurrentIndex = 0;

  setSliderCurrentIndex(int index) {
    slideCurrentIndex = index;
    emit(ChangeSliderCurrentIndexState());
  }

  setProductDetails() async {
    emit(GetProductDetailsLoadingState());
    // var success = await AuthCubit.get(context).setAccessToken();
    // if (!success) {
    //   emit(GetProductDetailsNetworkConnectionFailedState());
    //   return;
    // }
    var response =
        await ProductDetailsApi.getProductDetailsById(selectedProductId);
    if (response?.success == 1) {
      selectedProductDetails = response?.productDetails;
      emit(GetProductDetailsSuccessState());
    } else if (response?.success == 0) {
      selectedProductDetails = null;
      emit(GetProductDetailsFailedState());
    } else {
      selectedProductDetails = null;
      emit(GetProductDetailsNetworkConnectionFailedState());
    }
  }

  addItemToWishlist(int productId) async {
    bool? isUserLoggedIn =
        MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    if (isUserLoggedIn == false) {
      showAppSnackBar(content: "You must login to add product to wish list");
      return;
    }

    var success = await AuthCubit.get(context).setAccessToken();
    if (success == false) {
      return;
    }

    emit(AddItemToFavoritesLoadingState());
    var response = await WishListApis.addItemToWishlist(productId);
    if (response == true) {
      showAppSnackBar(content: "Product added to wishlist");
      emit(AddItemToFavoritesSuccessState());
    } else if (response == false) {
      showAppSnackBar(content: "Error occured");

      emit(AddItemToFavoritesFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(AddItemToFavoritesNetworkConnectionFailedState());
    }
  }
}
