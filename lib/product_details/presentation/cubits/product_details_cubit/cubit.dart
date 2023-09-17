import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/product_details/data/data_sources/remote_data_sources/product_details_api.dart';
import 'package:classic_eccomerce/product_details/data/models/get_product_details_response.dart';
import 'package:classic_eccomerce/product_details/presentation/cubits/product_details_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../cart/presentation/cubits/cart_cubit/cubit.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates>{

  int selectedProductId;
  BuildContext context = MyApp.navKey.currentState!.context;
  ProductDetailsCubit({required this.selectedProductId}):super(ProductDetailsInitialState());
  
  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  
  ProductDetails? selectedProductDetails;
  
  setProductDetails() async {
    emit(GetProductDetailsLoadingState());
    var success = await AuthCubit.get(context).setSessionId();
    if (!success) {
      emit(GetProductDetailsNetworkConnectionFailedState());
      return;
    }
    var response = await ProductDetailsApi.getProductDetailsById(selectedProductId);
    if(response?.success == 1){
      selectedProductDetails = response?.productDetails;
      emit(GetProductDetailsSuccessState());
    }else if(response?.success == 0){
      selectedProductDetails = null;
      emit(GetProductDetailsFailedState());
    }
    else{
      selectedProductDetails = null;
      emit(GetProductDetailsNetworkConnectionFailedState());
    }
  }
  
}