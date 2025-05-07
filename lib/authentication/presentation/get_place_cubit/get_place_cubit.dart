import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/authentication/data/data_sources/remote_data_sources/get_plcae_apis.dart';
import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/get_governorate.dart';
import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/get_judiciary.dart';
import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/get_way_by_Judiciary.dart';
import 'package:classic_eccomerce/authentication/data/models/get_place_governorate_response/place_form_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_place_state.dart';

class GetPlaceCubit extends Cubit<GetPlaceState> {
  GetPlaceCubit() : super(GetPlaceInitial());
  static GetPlaceCubit get(context)=>BlocProvider.of(context);
  List<GovernorateAD> governorate= [];
  List<JudiciaryAD> judiciary= [];
  List<WayAD> way= [];
  PlaceFormInput placeFormInput=PlaceFormInput();



  setGovernorate()async  {
    emit(GetGovernorateLoadingState());
    var response = await GetPlaceApis.getGovernorate();
    print(response?.message);
    if (response?.isSuccssed == true) {
      governorate = response?.obj ?? [];
      emit(GetGovernorateSuccessfulState());
    }
  }
  selectedGovernorate(int governorateId)async  {
    placeFormInput.governorateId=governorateId;
    emit(SelectedGovernorateState());
  }


  setJudiciary()async  {
    print('object');
    emit(GetJudiciaryLoadingState());
    var response = await GetPlaceApis.getJudiciary(placeFormInput.governorateId??0);
    print(response?.message);
    if (response?.isSuccssed == true) {
      judiciary = response?.obj ?? [];
      emit(GetJudiciarySuccessfulState());
    }
  }
  selectedJudiciary(int judiciaryId)async  {
    placeFormInput.judiciaryId=judiciaryId;
    emit(SelectedJudiciaryState());
  }


  setWay()async  {
    print('object');
    emit(GetWayLoadingState());

    var response = await GetPlaceApis.getWay(placeFormInput.judiciaryId??0);
    print(response?.message);
    if (response?.isSuccssed == true) {
      way = response?.obj ?? [];
      emit(GetWaySuccessfulState());
    }
  }
  selectedWay(int wayId)async  {
    placeFormInput.wayId=wayId;
    emit(SelectedWayState());
  }

}
