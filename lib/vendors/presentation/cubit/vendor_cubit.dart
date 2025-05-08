import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/vendors/presentation/cubit/vendor_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../vendors/data/data_sources/vendor_apis.dart';
import '../../../home/data/models/get_vendors_response.dart';
import '../../../home/data/models/product.dart';
import '../../../shared_components/app_snackbar.dart';

class VendorsCubit extends Cubit<VendorsStates> {
  VendorsCubit() : super(VendorsInitialState());

  static VendorsCubit get(BuildContext context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;
  List<Product> products = [];

  int allProductsPageNumber = 1;

  int allProductsPageSize = 100000;

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
        price: e.price,
        name: e.productName,
        productImagePath: (ApiUrls.BASE_URL?.replaceAll("\\", "")??"") +( e.file?.fileUrl??""),
        productSource: e.source?.toInt()
      ))
          ?.toList() ??
          [];
      if (tempCustomerOrders?.isEmpty == true) {
        emit(FetchingAllVendorProductsSuccessState());
        return;
      }
      print(tempCustomerOrders?.first?.productImagePath);
     // allProductsPageNumber++;
      products = (tempCustomerOrders);
      emit(FetchingAllVendorProductsSuccessState());
    } else if (response?.isSuccssed == false) {
      emit(FetchingAllVendorProductsFailedState());
    } else {
      emit(FetchingAllVendorProductsNetworkConnectionFailedState());
    }
  }

}
