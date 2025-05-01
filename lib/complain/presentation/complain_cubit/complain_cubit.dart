import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/complain/data/models/complain_form_input.dart';
import 'package:classic_eccomerce/complain/presentation/complain_cubit/complain_state.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/data/models/success_message_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/helpers/dio_helper.dart';
import '../../../main.dart';
import '../../../shared_components/app_snackbar.dart';
import '../../data/data_source/remote_data_source/complain_apis.dart';

class ComplainCubit extends Cubit<ComplainStates>{
  ComplainCubit() : super(ComplainInitialState());

  final dioHelper = DioHelper.instance;

  BuildContext context = MyApp.navKey.currentState!.context;

  GlobalKey<FormState> complainFormKey = GlobalKey<FormState>();

  ComplainFormInput complainFormInput = ComplainFormInput();

  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();

  static ComplainCubit get(context) => BlocProvider.of(context);


  Future createComplain(context) async {
    if (validateComplainForm() != true) {
      return;
    }

    complainFormKey.currentState?.save();
    emit(CreateComplainLoadingState());
    // if (await setAccessToken() == false) {
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(RegisterNetworkFailedConnectionState());
    //   return;
    // }

    var response = await ComplainApis.Complain(complainFormInput.toJson());
    if (response?.success == true) {
      print(response?.success);
      showAppSnackBar(
          content: AppLocalizations.of(context)!.your_complain_has_been_successfully_processed,color: AppColors.APP_MAIN_COLOR);
      title.text='';
      description.text='';
      emit(CreateComplainSuccessState());
      // Navigator.pop(context);
    } else if (response?.success == false) {
      // isUserLoggedIn = false;
      print(response?.success);

      showAppSnackBar(
          content:AppLocalizations.of(context)!.error_occurred_try_again
              );
      emit(CreateComplainFailedState());
    } else {
      // isUserLoggedIn = false;
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(ComplainNetworkFailedConnectionState());
    }
  }

  validateComplainForm() {
    return complainFormKey.currentState!.validate();
  }

}