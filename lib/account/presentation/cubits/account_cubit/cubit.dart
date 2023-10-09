import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/account/data/data_sources/remote_data_sources/account_apis.dart';
import 'package:classic_eccomerce/account/data/models/account_input.dart';
import 'package:classic_eccomerce/account/data/models/change_password_input.dart';
import 'package:classic_eccomerce/account/data/models/get_account_addresses_response.dart';
import 'package:classic_eccomerce/account/data/models/get_account_details_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_components/app_snackbar.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitialState());

  static AccountCubit get(context) => BlocProvider.of(context);

  Account? accountDetails;
  List<AccountAddress>? accountAddresses;
  GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  AccountInput accountInput =
      AccountInput(firstName: "", lastName: "", email: "", phoneNumber: "");
  ChangePasswordInput changePasswordInput =
      ChangePasswordInput(password: "", confirmPassword: "");

  setAccountDetails() async {
    emit(GetAccountLoadingState());
    var response = await AccountApis.getAccountDetails();
    if (response?.success == 1) {
      accountDetails = response?.account;
      firstNameEditingController.text = accountDetails?.firstname ?? "";
      lastNameEditingController.text = accountDetails?.lastname ?? "";
      emailEditingController.text = accountDetails?.email ?? "";
      phoneEditingController.text = accountDetails?.telephone ?? "";
      emit(GetAccountSuccessState());
    } else if (response?.success == 0) {
      accountDetails = null;
      emit(GetAccountFailedState());
    } else {
      accountDetails = null;
      emit(GetAccountNetworkConnectionFailedState());
    }
  }

  editAccountDetails() async {
    var isFormValid = accountFormKey.currentState?.validate();
    if (isFormValid != true) {
      return;
    }
    accountFormKey.currentState?.save();

    emit(EditAccountLoadingState());
    var response = await AccountApis.editAccountDetails(accountInput.toJson());
    if (response?.success == true) {
      showAppSnackBar(
          content: "You account information is successfully updated");

      emit(EditAccountSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");

      emit(EditAccountFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");

      emit(EditAccountNetworkConnectionFailedState());
    }
  }

  changeAccountPassword() async {
    changePasswordFormKey.currentState?.save();
    var isFormValid = changePasswordFormKey.currentState?.validate();
    if (isFormValid != true) {
      return;
    }
    changePasswordFormKey.currentState?.save();
    emit(ChangeAccountPasswordLoadingState());
    var response =
        await AccountApis.changePassword(changePasswordInput.toJson());
    if (response?.success == true) {
      showAppSnackBar(
          content: "You account password is successfully updated");

      emit(ChangeAccountPasswordSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");

      emit(ChangeAccountPasswordFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");

      emit(ChangeAccountPasswordNetworkConnectionFailedState());
    }
  }

  setAccountAddresses() async{
    emit(GetAccountAddressesLoadingState());
    var response = await AccountApis.getAccountAddresses();
    if(response?.success == 1){
      accountAddresses = response?.data?.addresses;
      emit(GetAccountAddressesSuccessState());
    }else if(response?.success == 0){
      accountAddresses = null;
      emit(GetAccountAddressesFailedState());
    }else{
      accountAddresses = null;
      emit(GetAccountAddressesNetworkConnectionFailedState());
    }
  }
}
