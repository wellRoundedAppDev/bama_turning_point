import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/states.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/get_categories_response.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;
  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<Category>? categories;
  List<Product>? products;
  Category? selectedCategory;

  setCategories() async {
    emit(GetCategoriesLoadingState());
    // var success = await AuthCubit.get(context).setSessionId();
    // if (!success) {
    //   emit(GetCategoriesNetworkFailedState());
    //   return;
    // }
    var response = await CategoriesApis.getCategories(1);
    if (response?.success == 1) {
      categories = response?.categories;
      emit(GetCategoriesSuccessState());
    } else if (response?.success == 0) {
      categories = null;
      emit(GetCategoriesFailedState());
    } else {
      categories = null;
      emit(GetCategoriesNetworkFailedState());
    }
  }

  setSelectedCategory(Category? category){
    selectedCategory = category;
  }

  setAllProductsInCategory(Category? category) async {
    setSelectedCategory(category);
    emit(GetProductsInCategoryLoadingState());
    var response = await CategoriesApis.getProductsInCategoryById(selectedCategory?.categoryId?.toInt()??0);
    if(response?.success == 1){
      products = response?.products;
      emit(GetProductsInCategorySuccessState());
    }
    else if(response?.success == 0){
      products = null;
      emit(GetProductsInCategoryFailedState());
    }
    else{
      products = null;
      emit(GetProductsInCategoryFailedNetworkConnectionState());
    }
  }

}
