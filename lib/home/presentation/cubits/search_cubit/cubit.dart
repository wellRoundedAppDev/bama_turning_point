import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/search_apis.dart';
import 'package:classic_eccomerce/home/presentation/cubits/search_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_settings/app_language_codes.dart';
import '../../../../main.dart';
import '../../../../shared_components/app_snackbar.dart';
import '../../../data/models/search_response.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;

  List<SearchItem>? searchItems;

  setSearchResults(String searchTerm) async{
   // AccountApis.getLanguages();
    emit(SearchByTermLoadingState());
    var response = await SearchApis.searchByTerm(searchTerm,
        languageCode: languageCodes[LocaleCubit.get(context).locale.languageCode],
      currencyCode: AppSettingsCubit.get(context).currencyCode
    );
    if(response?.success == 1){
      // AccountApis.getLanguages();
      searchItems = response?.searchItems??[];
      emit(SearchByTermSuccessState());
    }
    else if(response?.success == 0){

      searchItems = [];
      showAppSnackBar(content: "Error occurred");

      emit(SearchByTermFailedState());
    }
    else{
      searchItems = [];
      showAppSnackBar(content: "Check your internet connection, and try again");

      emit(SearchByTermNetworkConnectionFailedState());
    }
  }



}
