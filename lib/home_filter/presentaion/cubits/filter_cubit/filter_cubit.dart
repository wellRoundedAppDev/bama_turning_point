import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_color_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_groups_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_manufacture_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_size_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_supplier_api.dart';
import 'package:classic_eccomerce/home_filter/data/model/filter_form_input.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_color_response.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_groups_response.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_manufacture_company_response.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_size_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../categories/data/models/get_categories_response.dart';
import '../../../../categories/data/models/get_products_in_category_response.dart';
import '../../../../shared_components/app_snackbar.dart';
import '../../../data/data_source/remote_data_source/get_category_api.dart';
import '../../../data/data_source/remote_data_source/post_filter_api.dart';
import '../../../data/model/get_response_model/get_category_response.dart';
import '../../../data/model/get_response_model/get_supplier_response.dart';



part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  static FilterCubit get(BuildContext context) => BlocProvider.of(context);
  List<GroupsAD> groups= [];
  List<ColorAD> colors = [];
  List<SizeAD> size = [];
  // List manufacturerCompany = [];
  RangeValues rangeValues = RangeValues(0,100000);
  FilterFormInput filterFormInput=FilterFormInput();
  List<ProductInCategory>?result=[];
  bool isCompany=true;

  void radioFunctionIsCompany(value) {
    isCompany = value;
    emit(SelectedRadioCompany());
  }

  init() async {
    emit(FetchingFilterLoadingState());
    await setGroups();
    await setColors();
    await setSize();
    emit(FetchingFilterSuccessState());
  }
  // String? selectedGroup;
  void radioFunctionGroup(value) {
    filterFormInput.groupId = value;
     emit(SelectedRadioGroup());
  }
  setGroups()async  {
    print('object');
    var response = await GetGroupsFilterApi.getGroups();
    // response!.obj!.forEach((element) => groupRadioList.add(GroupRadioModel(false, element)),);
    print(response?.message);
    if (response?.isSuccssed == true) {
      groups = response?.obj ?? [];
    }
  }








  String? selectedColor;
  void selectFunctionColor(value){
    selectedColor = value;
    emit(SelectedRadioColor());
  }
  setColors() async {
    var response = await GetColorsApis.getColors();
    print(response?.message);

    if (response?.isSuccssed == true) {
      colors = response?.obj ?? [];
    }
  }

  void radioFunctionSize(value) {
    filterFormInput.size = value;
    emit(SelectedRadioManufacture());
  }
  setSize() async {
    var response = await GetSizeApis.getSize();
    print(response?.message);

    if (response?.isSuccess == true) {
      size = response?.obj ?? [];
    }
  }


  fetchPrice(RangeValues value){
    rangeValues=value;
    filterFormInput.sellingPriceMinimum=rangeValues.start as double;
    filterFormInput.sellingPriceMinimumMaximum=rangeValues.end as double;
    emit(FetchingPriceFilterState());
  }







  Future createFilter(context) async {
    emit(CreateFilterLoadingState());
    var response = await FilterApi.getFilterHome(filterFormInput.toJson(),isCompany);
    if (response?.isSuccssed == true) {
      result=response?.obj?.products??[];
      response?.obj?.products?.isEmpty == true?showAppSnackBar(content: "There is no product"):null;
      emit(CreateFilterSuccessState());
    } else if (response?.isSuccssed == false) {
      print(response?.isSuccssed);

      showAppSnackBar(
          content:AppLocalizations.of(context)!.error_occurred_try_again
      );
      emit(CreateFilterFailedState());
    } else {
      // isUserLoggedIn = false;
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(FilterNetworkFailedConnectionState());
    }
  }

  deleteValue(){
    filterFormInput.groupId=null;
    filterFormInput.groupId=null;
    filterFormInput.colors=null;
    filterFormInput.supplierId=null;
    filterFormInput.sellingPriceMinimum=null;
    filterFormInput.sellingPriceMinimumMaximum=null;
    filterFormInput.size=null;
    emit(DeleteSelectedRadio());
  }

}
