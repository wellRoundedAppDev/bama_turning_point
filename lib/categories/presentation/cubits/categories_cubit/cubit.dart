import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/states.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_settings/app_language_codes.dart';
import '../../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/locales/locale_cubit/locale_cubit.dart';
import '../../../data/models/get_categories_paginated_response.dart';
import '../../../data/models/get_categories_response.dart';
import '../../../data/models/get_products_in_category_response.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;
  static CategoriesCubit get(context) => BlocProvider.of(context);

  //todo check
  // List<Category>? categories;
  List<Category2>? categories;
  int currentCategoriesPage = 1;

  // List<ProductInCategory>? products;
  // List<Category>? categories;
  List<ProductInCategory>? products;
  Category2? selectedCategory;



  setCategories() async {
    emit(GetCategoriesLoadingState());
    LocaleCubit localeCubit = LocaleCubit.get(context);
    bool? isUserLoggedIn =
        MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
    String? accessToken =
        MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;

    emit(GetCategoriesLoadingState());
    var response = await CategoriesApis.getCategoriesPaginated(pageSize: 1000,pageNumber: 1);

    if(response?.isSuccssed == true){
      categories = response?.obj?.dataReturn;
      currentCategoriesPage++;
     emit(GetCategoriesSuccessState());

    }else if(response?.isSuccssed == false){

      emit(GetCategoriesFailedState());
    }else{

      emit(GetCategoriesNetworkFailedState());
    }

    // if (isUserLoggedIn == false && accessToken == null) {
    //   var success = await AuthCubit.get(context).setAccessToken();
    //   if (!success) {
    //     emit(GetCategoriesNetworkFailedState());
    //     return;
    //   }
   // }

    // var response = await CategoriesApis.getCategories(1,
    //     languageCode: languageCodes[localeCubit.locale.languageCode],
    //     currencyCode: AppSettingsCubit.get(context)?.currencyCode ?? "");

    // if (response?.success == 1) {
    //   categories = response?.categories;
    //   emit(GetCategoriesSuccessState());
    // } else if (response?.success == 0) {
    //   categories = null;
    //   emit(GetCategoriesFailedState());
    // } else {
    //   categories = null;
    //   emit(GetCategoriesNetworkFailedState());
    // }
  }


  // setCategories() async {
  //   emit(GetCategoriesLoadingState());
  //   LocaleCubit localeCubit = LocaleCubit.get(context);
  //   bool? isUserLoggedIn =
  //       MyApp.navKey.currentState?.context.read<AuthCubit>().isUserLoggedIn;
  //   String? accessToken =
  //       MyApp.navKey.currentState?.context.read<AuthCubit>().accessToken;
  //
  //   if (isUserLoggedIn == false && accessToken == null) {
  //     var success = await AuthCubit.get(context).setAccessToken();
  //     if (!success) {
  //       emit(GetCategoriesNetworkFailedState());
  //       return;
  //     }
  //   }
  //
  //   var response = await CategoriesApis.getCategories(1,
  //       languageCode: languageCodes[localeCubit.locale.languageCode],
  //       currencyCode: AppSettingsCubit.get(context)?.currencyCode ?? "");
  //
  //   if (response?.success == 1) {
  //     categories = response?.categories;
  //     emit(GetCategoriesSuccessState());
  //   } else if (response?.success == 0) {
  //     categories = null;
  //     emit(GetCategoriesFailedState());
  //   } else {
  //     categories = null;
  //     emit(GetCategoriesNetworkFailedState());
  //   }
  // }

  setSelectedCategory(Category2? category) {
    selectedCategory = category;
  }

    setAllProductsInCategory(Category2? category) async {
    LocaleCubit localeCubit = LocaleCubit.get(context);
    setSelectedCategory(category);
    emit(GetProductsInCategoryLoadingState());
    var response = await CategoriesApis.getProductsInCategoryById(
        selectedCategory?.id?.toInt() ?? 0,
        pageNumber: 1,
        pageSize: 1000,
        languageCode: languageCodes[localeCubit.locale.languageCode],
        currencyCode: AppSettingsCubit.get(context).currencyCode ?? "");
    if (response?.isSuccssed == true) {
      products = response?.obj!.products;
       // products = products?.where((e) => e.stockStatusId != 5).toList();

      emit(GetProductsInCategorySuccessState());
    } else if (response?.isSuccssed == false) {
      products = null;
      emit(GetProductsInCategoryFailedState());
    } else {
      products = null;
      emit(GetProductsInCategoryFailedNetworkConnectionState());
    }
  }
}
