import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/product_details/data/data_sources/remote_data_sources/product_details_api.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/states.dart';
import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
import 'package:classic_eccomerce/wish_list/data/data_sources/remote_data_sources/wish_list_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/locales/locale_cubit/locale_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  int selectedProductId;
  bool isCompany;
  BuildContext context = MyApp.navKey.currentState!.context;
  LocaleCubit? localeCubit;
  Map<String, dynamic> selectedOption = {"option": {}};
   int? selectSizeID;
   int? selectColorID;

  ProductDetailsCubit(
      {required this.selectedProductId,  this.isCompany = true})
      : super(ProductDetailsInitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductModel? selectedProductDetails;
  int slideCurrentIndex = 0;

  setSliderCurrentIndex(int index) {
    slideCurrentIndex = index;
    emit(ChangeSliderCurrentIndexState());
  }

  void setColorID(int id) {
    if(selectColorID==id) {
      selectColorID=null;
    } else {
      selectColorID = id;
    }
    emit(SetColorIDState());
  }

  void setSizeID(int id) {
    if(selectSizeID==id) {
      selectSizeID=null;
    } else {
      selectSizeID = id;
    }
    emit(SetSizeIDState());
  }

  setProductDetails() async {
    localeCubit = LocaleCubit.get(context);
    emit(GetProductDetailsLoadingState());
    // var success = await AuthCubit.get(context).setAccessToken();
    // if (!success) {
    //   emit(GetProductDetailsNetworkConnectionFailedState());
    //   return;
    // }
    // selectedProductDetails = ProductDetails(name: "P1",price: 200,id: 1,description: "Desc",priceFormated: "200IQD"
    // ,
    // );
    //
    // emit(GetProductDetailsSuccessState());
    //
    // return;
    var response = await ProductDetailsApi.getProductDetailsById(
        selectedProductId, isCompany,
        languageCode: languageCodes[localeCubit?.locale.languageCode ?? ""],
        currencyCode: AppSettingsCubit.get(context).currencyCode);
    if (response?.success == true) {
      selectedProductDetails = response?.productDetails;
      emit(GetProductDetailsSuccessState());
    } else if (response?.success == false) {
      emit(GetProductDetailsFailedState());
    } else {
      emit(GetProductDetailsNetworkConnectionFailedState());
    }
  }

  addItemToWishlist(int productId, int productSource) async {
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
    var response =
        await WishListApis.addItemToWishlist(productId, productSource);
    if (response?.success == true) {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.product_added_to_favorites);
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

  setOption(Option? option, OptionValue? optionValue) {
    selectedOption['option'][option?.productOptionId?.toString()] =
        optionValue?.productOptionValueId?.toString();

    // {
    //   "${option?.productOptionId}": "${optionValue?.productOptionValueId}"
    // };
    emit(SetSelectedOptionState());
  }

// setRelatedProducts() async {
//   emit(GetRelatedProductsLoadingState());
//   var response = await ProductsApis.getFeaturedProducts();
//   if (response?.success == 1) {
//     allProducts = response?.data?[0].products;
//     emit(FetchingAllProductsSuccessState());
//   } else if (response?.success == 0) {
//     allProducts = null;
//     emit(GetRelatedProductsFailedState());
//   } else {
//     allProducts = null;
//     emit(GetRelatedProductsNetworkConnectionFailedState());
//   }
// }
}
