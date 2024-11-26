import 'package:classic_eccomerce/used/data/data_sources/remote_data_sources/used_products_by_client_apis.dart';
import 'package:classic_eccomerce/used/data/models/used_products_by_client_response.dart';
import 'package:classic_eccomerce/used/presentation/cubit/used_product_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../../shared_components/app_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsedProductsCubit extends Cubit<UsedProductsStates> {

  bool byClients;

  UsedProductsCubit({required this.byClients}) : super(UsedProductsInitialState());

  static UsedProductsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;

  List<UsedProduct>? products;

  init(){
    if(byClients){
      setProductsByClient();
    }
    else{
      setProductsByCompany();
    }
  }

  setProductsByClient() async {
    // AccountApis.getLanguages();
    emit(UsedProductsLoadingState());
    var response = await UsedProductsApis.getUsedProductsByClients();
    if (response?.status == true) {
      // AccountApis.getLanguages();
      products = response?.data?.products ?? [];
      emit(UsedProductsSuccessState());
    } else if (response?.status == false) {
      products = [];
      showAppSnackBar(
          content: AppLocalizations.of(context)!.error_occurred_try_again);

      emit(UsedProductsFailedState());
    } else {
      products = [];
      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);

      emit(UsedProductsNetworkConnectionFailedState());
    }
  }

  setProductsByCompany() async {
    // AccountApis.getLanguages();
    emit(UsedProductsLoadingState());
    var response = await UsedProductsApis.getUsedProductsByCompany();
    if (response?.status == true) {
      // AccountApis.getLanguages();
      products = response?.data?.products ?? [];
      emit(UsedProductsSuccessState());
    } else if (response?.status == false) {
      products = [];
      showAppSnackBar(
          content: AppLocalizations.of(context)!.error_occurred_try_again);

      emit(UsedProductsFailedState());
    } else {
      products = [];
      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);

      emit(UsedProductsNetworkConnectionFailedState());
    }
  }

}
