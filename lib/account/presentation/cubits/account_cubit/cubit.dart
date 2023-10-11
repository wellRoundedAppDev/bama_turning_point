import 'package:classic_eccomerce/account/data/data_sources/remote_data_sources/account_apis.dart';
import 'package:classic_eccomerce/account/data/models/account_address_input.dart';
import 'package:classic_eccomerce/account/data/models/account_input.dart';
import 'package:classic_eccomerce/account/data/models/change_password_input.dart';
import 'package:classic_eccomerce/account/data/models/get_account_addresses_response.dart';
import 'package:classic_eccomerce/account/data/models/get_account_details_response.dart';
import 'package:classic_eccomerce/account/data/models/get_customer_orders_response.dart';
import 'package:classic_eccomerce/account/data/models/get_order_details_response.dart';
import 'package:classic_eccomerce/account/presentation/cubits/account_cubit/states.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/data_sources/remote_data_sources/get_countries_api.dart';
import '../../../../core/data/models/get_countries_response.dart';
import '../../../../core/data/models/get_regions_response.dart';
import '../../../../shared_components/app_snackbar.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;

  static AccountCubit get(context) => BlocProvider.of(context);

  Account? accountDetails;
  List<AccountAddress>? accountAddresses;
  GlobalKey<FormState> accountInformationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> accountAddressFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  AccountInput accountInput =
      AccountInput(firstName: "", lastName: "", email: "", phoneNumber: "");
  ChangePasswordInput changePasswordInput =
      ChangePasswordInput(password: "", confirmPassword: "");
  AccountAddressInput accountAddressInput = AccountAddressInput(
      firstName: "",
      lastName: "",
      address: "",
      country: null,
      city: "",
      region: null,
      isDefaultAddress: null,
      postalCode: "");
  int? selectedAddressId;
  List<CustomerOrder>? customerOrders;
  int? selectedOrderId;
  OrderDetails? selectedOrder;
  int customerOrdersPageNumber = 1;

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
    var isFormValid = accountInformationFormKey.currentState?.validate();
    if (isFormValid != true) {
      return;
    }
    accountInformationFormKey.currentState?.save();

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
      showAppSnackBar(content: "You account password is successfully updated");

      emit(ChangeAccountPasswordSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");

      emit(ChangeAccountPasswordFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");

      emit(ChangeAccountPasswordNetworkConnectionFailedState());
    }
  }

  setAccountAddresses() async {
    emit(GetAccountAddressesLoadingState());
    var response = await AccountApis.getAccountAddresses();
    if (response?.success == 1) {
      accountAddresses = response?.data?.addresses;
      emit(GetAccountAddressesSuccessState());
    } else if (response?.success == 0) {
      accountAddresses = null;
      emit(GetAccountAddressesFailedState());
    } else {
      accountAddresses = null;
      emit(GetAccountAddressesNetworkConnectionFailedState());
    }
  }

  Future<List<Country>> getCountries() async {
    var response = await GetCountriesAndRegionsApi.getCountries();
    if (response?.success == 1) {
      return response?.countries ?? [];
    } else {
      return [];
    }
  }

  setAccountAddressCountry(Country country) {
    accountAddressInput.country = country;
    accountAddressInput.region = null;
    emit(AccountAddressSelectedState());
  }

  Future<List<Region>> getRegions() async {
    var response = await GetCountriesAndRegionsApi.getRegionsByCountryId(
        accountAddressInput.country?.countryId?.toInt() ?? 0);
    if (response?.success == 1) {
      return response?.data?.regions ?? [];
    } else {
      return [];
    }
  }

  setAccountAddressRegion(Region region) {
    accountAddressInput.region = region;
  }

  setAccountDefaultAddress(bool state) {
    accountAddressInput.isDefaultAddress = state;
    emit(DefaultAddressSelectedState());
  }

  addAddressToAccount() async {
    accountAddressFormKey.currentState?.save();
    var isFormValid = accountAddressFormKey.currentState?.validate();
    if (isFormValid != true) {
      return;
    }
    accountAddressFormKey.currentState?.save();
    emit(AddAddressLoadingState());
    var response =
        await AccountApis.addAccountAddress(accountAddressInput.toJson());
    if (response?.success == true) {
      setAccountAddresses();
      Navigator.pop(context);
      showAppSnackBar(content: "Address is added successfully");
      emit(AddAddressSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");
      emit(AddAddressFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(AddAddressNetworkConnectionFailedState());
    }
  }

  editAddressInAccount(int addressId) async {
    accountAddressFormKey.currentState?.save();
    var isFormValid = accountAddressFormKey.currentState?.validate();
    if (isFormValid != true) {
      return;
    }
    accountAddressFormKey.currentState?.save();
    emit(EditAddressLoadingState());
    var response = await AccountApis.editAccountAddress(
        accountAddressInput.toJson(), addressId);
    if (response?.success == true) {
      setAccountAddresses();
      Navigator.pop(context);
      showAppSnackBar(content: "Address is updated successfully");
      emit(EditAddressSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");
      emit(EditAddressFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(EditAddressNetworkConnectionFailedState());
    }
  }

  setSelectedAddressId(int addressId) {
    selectedAddressId = addressId;
  }

  deleteAddressInAccount(int addressId) async {
    setSelectedAddressId(addressId);
    emit(DeleteAddressLoadingState());
    var response = await AccountApis.deleteAccountAddress(addressId);
    if (response?.success == true) {
      setAccountAddresses();
      showAppSnackBar(content: "Address is deleted successfully");
      emit(DeleteAddressSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");
      emit(DeleteAddressFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(DeleteAddressNetworkConnectionFailedState());
    }
  }

  initAddAddressScreen() {
    accountAddressInput.country = null;
    accountAddressInput.region = null;
    accountAddressInput.isDefaultAddress = true;
  }

  initEditAddressScreen(AccountAddress? address) {
    accountAddressInput.country = Country(
        countryId: int.parse(address?.countryId ?? ""), name: address?.country);
    accountAddressInput.region =
        Region(zoneId: address?.zoneId, name: address?.zone);
    accountAddressInput.isDefaultAddress = address?.defaultAddress;
  }

  setFirstCustomerOrders() async {
    emit(GetFirstCustomerOrdersLoadingState());
    var response = await AccountApis.getCustomerOrders(1);
    if (response?.success == 1) {
      var tempCustomerOrders = response?.customerOrders??[];
      customerOrdersPageNumber++;
      customerOrders?.addAll(tempCustomerOrders);
      emit(GetFirstCustomerOrdersSuccessState());
    } else if (response?.success == 0) {
      customerOrders = null;
      emit(GetFirstCustomerOrdersFailedState());
    } else {
      customerOrders = null;
      emit(GetFirstCustomerOrdersNetworkConnectionFailedState());
    }
  }

  addMoreCustomerOrders() async {
    emit(AddMoreCustomerOrdersLoadingState());
    var response = await AccountApis.getCustomerOrders(customerOrdersPageNumber);
    if(response?.success == 1){
      var tempCustomerOrders = response?.customerOrders??[];
      if(tempCustomerOrders.isEmpty == true){
        emit(AddMoreCustomerOrdersSuccessState());
        return;
      }
      customerOrdersPageNumber++;
      customerOrders?.addAll(tempCustomerOrders);
      emit(AddMoreCustomerOrdersSuccessState());

    }
    else if(response?.success == 0){
      emit(AddMoreCustomerOrdersFailedState());
    }
    else{
      emit(AddMoreCustomerOrdersNetworkConnectionFailedState());
    }
  }

  setOrderDetails(int? id) async {
    selectedOrderId = id;
    emit(GetOrderDetailsLoadingState());
    var response = await AccountApis.getOrderDetails(id);
    if (response?.success == 1) {
      selectedOrder = response?.orderDetails;
      emit(GetOrderDetailsSuccessState());
    } else if (response?.success == 0) {
      selectedOrder = null;
      emit(GetOrderDetailsFailedState());
    } else {
      selectedOrder = null;
      emit(GetOrderDetailsNetworkConnectionFailedState());
    }
  }
}
