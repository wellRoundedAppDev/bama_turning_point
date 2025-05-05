import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_color_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_groups_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_manufacture_api.dart';
import 'package:classic_eccomerce/home_filter/data/data_source/remote_data_source/get_supplier_api.dart';
import 'package:classic_eccomerce/home_filter/data/model/filter_form_input.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_color_response.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_groups_response.dart';
import 'package:classic_eccomerce/home_filter/data/model/get_response_model/get_manufacture_company_response.dart';
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
  List<CategoryAD> category= [];
  List<BrandAD> manufacture= [];
  List<SupplierAD> suppliers = [];
  List<ColorAD> colors = [];
  // List manufacturerCompany = [];
  RangeValues rangeValues = RangeValues(0,15000);
  TextEditingController startPrice=TextEditingController();
  TextEditingController endPrice=TextEditingController();
  FilterFormInput filterFormInput=FilterFormInput();
  List<Products>?result=[];

  init() async {
    emit(FetchingFilterLoadingState());
    await setGroups();
    await setCategory();
    await setManufacture();
    await setSuppliers();
    await setColors();
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

  void radioFunctionCategory(value) {
    filterFormInput.categoryId = value;
    emit(SelectedRadioCategory());
  }
  setCategory()async  {
    print('object');
    var response = await GetCategoryFilterApi.getCategory();
    // response!.obj!.forEach((element) => groupRadioList.add(GroupRadioModel(false, element)),);
    print(response?.message);
    if (response?.isSuccssed == true) {
      category = response?.obj ?? [];
    }
  }

  void radioFunctionManufacture(value) {
    filterFormInput.manufactureCompanyId = value;
    emit(SelectedRadioManufacture());
  }
  setManufacture()async  {
    print('object');
    var response = await GetManufactureFilterApi.getManufacture();
    // response!.obj!.forEach((element) => groupRadioList.add(GroupRadioModel(false, element)),);
    print(response?.message);
    if (response?.isSuccssed == true) {
      manufacture = response?.obj ?? [];
    }
  }


  // String? selectedSuppliers;
  void radioFunctionSuppliers(value) {
    filterFormInput.supplierId = value;
    emit(SelectedRadioSuppliers());
  }
  setSuppliers() async {
    var response = await GetSupplierApis.getSupplier();
    print(response?.message);

    if (response?.isSuccssed == true) {
      suppliers = response?.obj ?? [];
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


  fetchPrice(RangeValues value){
    rangeValues=value;
    filterFormInput.sellingPriceMinimum=rangeValues.end as double;
    filterFormInput.sellingPriceMinimumMaximum=rangeValues.start as double;
    emit(FetchingPriceFilterState());
  }







  Future createFilter(context) async {
    emit(CreateFilterLoadingState());
    var response = await FilterApi.getFilterHome(filterFormInput.toJson());
    if (response?.isSuccssed == true) {
      result=response!.obj!.products!;
      response.obj!.products!.isEmpty?showAppSnackBar(content: "There is no product"):null;
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
    filterFormInput.categoryId=null;
    filterFormInput.manufactureCompanyId=null;
    filterFormInput.colors=null;
    filterFormInput.supplierId=null;
    filterFormInput.sellingPriceMinimum=null;
    filterFormInput.sellingPriceMinimumMaximum=null;
    filterFormInput.size="";
    emit(DeleteSelectedRadio());
  }

}
