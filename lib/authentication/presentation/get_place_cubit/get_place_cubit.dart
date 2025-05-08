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

  PlaceFormInput placeFormInput=PlaceFormInput();
  GovernorateAD? selectedGovernorateItem;
  JudiciaryAD? selectedJudiciaryItem;
  WayAD? selectedWayItem;


  Future<List<GovernorateAD>> fetchGovernorates() async {
    emit(GetGovernorateLoadingState());
    var response = await GetPlaceApis.getGovernorate();
    print(response?.message);
    if (response?.isSuccssed == true) {
      emit(GetGovernorateSuccessfulState());
      return response?.obj ?? [];
    } else if (response?.isSuccssed == 0) {
      emit(GetGovernorateFailedState());
      return [];
    } else {
      emit(FetchingGovernorateScreenNetworkFailedState());
      return [];
    }
  }
  selectedGovernorate(int governorateId)async  {
    selectedJudiciaryItem = null;
    selectedWayItem = null;
    placeFormInput.judiciaryId = null;
    placeFormInput.wayId = null;
    placeFormInput.governorateId=governorateId;

    emit(SelectedGovernorateState());
  }


  Future<List<JudiciaryAD>> fetchJudiciaries() async {
    emit(GetJudiciaryLoadingState());
    var response = await GetPlaceApis.getJudiciary(placeFormInput.governorateId ?? 0);
    print(response?.message);
    if (response?.isSuccssed == true) {
      emit(GetJudiciarySuccessfulState());
      return response?.obj ?? [];
    } else if (response?.isSuccssed == 0) {
      emit(GetGovernorateFailedState());
      return [];
    } else {
      emit(FetchingJudiciaryScreenNetworkFailedState());
      return [];
    }
  }
  selectedJudiciary(int judiciaryId)async  {
    selectedWayItem = null;
    placeFormInput.wayId = null;
    placeFormInput.judiciaryId=judiciaryId;
    emit(SelectedJudiciaryState());
  }


  Future<List<WayAD>> fetchWays() async {
    emit(GetWayLoadingState());
    var response = await GetPlaceApis.getWay(placeFormInput.judiciaryId ?? 0);
    print(response?.message);
    if (response?.isSuccssed == true) {
      emit(GetWaySuccessfulState());
      return response?.obj ?? [];
    } else if (response?.isSuccssed == 0) {
      emit(GetWayFailedState());
      return [];
    } else {
      emit(FetchingWayScreenNetworkFailedState());
      return [];
    }
  }
  selectedWay(int wayId)async  {
    placeFormInput.wayId=wayId;
    emit(SelectedWayState());
  }

}
