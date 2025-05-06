import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/data/models/get_products_in_category_response.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/banners_apis.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_brands_api.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/vendor_apis.dart';
import 'package:classic_eccomerce/home/data/models/get_all_products_response.dart';
import 'package:classic_eccomerce/home/presentation/cubits/vendors_cubit/states.dart';
import 'package:classic_eccomerce/vendors/presentation/cubit/vendor_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_products_in_brand_response.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/screens/view_all_products_screen.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../account/data/data_sources/remote_data_sources/account_apis.dart';
import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../categories/data/models/get_categories_paginated_response.dart';
import '../../../../categories/data/models/get_categories_response.dart';
import '../../../../contact_us/data/data_sources/remote_data_sources/contact_us_api.dart';
import '../../../../vendors/data/data_sources/vendor_apis.dart';
import '../../../home/data/models/get_vendors_response.dart';
import '../../../shared_components/app_snackbar.dart';

class VendorsCubit extends Cubit<VendorsStates> {
  VendorsCubit() : super(VendorsInitialState());

  static VendorsCubit get(BuildContext context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;
  List<Product> products = [];

  int allProductsPageNumber = 1;

  int allProductsPageSize = 10;

    List<Vendor>? vendors;

  int page = 1;

  setVendors() async{
    // AccountApis.getLanguages();
    emit(VendorsLoadingState());
    var response = await VendorsApis.getVendors(
      pageNumber:page,
      pageSize: 1000,
    );
    if(response?.isSuccssed == true){
      // AccountApis.getLanguages();
      vendors = response?.vendors??[];
      emit(VendorsSuccessState());
    }
    else if(response?.isSuccssed == false){


      showAppSnackBar(content: AppLocalizations.of(context)!.error_occurred_try_again);

      emit(VendorsFailedState());
    }
    else{

      showAppSnackBar(content: AppLocalizations.of(context)!.network_connection_failed);

      emit(VendorsNetworkConnectionFailedState());
    }
  }


  setProducts(int vendorId) async {
    emit(FetchingAllVendorProductsLoadingState());
    var response = await VendorsApis.getAllProductsFromVendor(
      vendorId: vendorId,
        pageNumber: allProductsPageNumber, pageSize: allProductsPageSize);
    if (response?.isSuccssed == true) {
      var tempCustomerOrders = response?.obj?.products
          ?.map((e) => Product(
        productId: e.id,
        price: e.minorUnitPrice,
        name: e.productName,
      ))
          ?.toList() ??
          [];
      if (tempCustomerOrders?.isEmpty == true) {
        emit(FetchingAllVendorProductsSuccessState());
        return;
      }
      allProductsPageNumber++;
      products?.addAll(tempCustomerOrders);
      emit(FetchingAllVendorProductsSuccessState());
    } else if (response?.isSuccssed == false) {
      emit(FetchingAllVendorProductsFailedState());
    } else {
      emit(FetchingAllVendorProductsNetworkConnectionFailedState());
    }
  }

}
