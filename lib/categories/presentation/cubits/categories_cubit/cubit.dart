import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/presentation/cubits/categories_cubit/states.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/GetCategoriesResponse.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;
  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<Category>? categories;

  setCategories() async {
    emit(GetCategoriesLoadingState());
    var success = await AuthCubit.get(context).setSessionId();
    if (!success) {
      emit(GetCategoriesNetworkFailedState());
      return;
    }
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
}
