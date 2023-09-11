import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_banners_api.dart';
import 'package:classic_eccomerce/home/data/models/get_banners_response.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<BannerAd>? banners;

  setBanners() async {
    var response = await GetBannersApi.getBanners();
    if(response?.success == 1){
      banners = response?.banners;
    }else if(response?.success == 0){
      emit(FetchingHomeScreenFailedState());
    }else{
      emit(FetchingHomeScreenNetworkFailedState());
    }
  }

  init(){
    emit(FetchingHomeScreenLoadingState());
    setBanners();
  }

}
