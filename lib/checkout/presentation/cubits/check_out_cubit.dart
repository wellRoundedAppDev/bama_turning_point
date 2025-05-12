import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_cubit.dart';
import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/data/data_sources/checkout_apis.dart';
import 'package:classic_eccomerce/checkout/data/models/add_address_input.dart';
import 'package:classic_eccomerce/checkout/data/models/get_customer_payment_address_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_shipping_methods_response.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:classic_eccomerce/checkout/presentation/screens/order_success_screen.dart';
import 'package:classic_eccomerce/core/locales/locale_cubit/locale_cubit.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../app_settings/app_language_codes.dart';
import '../../../core/data/data_sources/remote_data_sources/get_countries_api.dart';
import '../../../core/data/models/get_countries_response.dart';
import '../../../core/data/models/get_regions_response.dart';
import '../../../shared_components/app_snackbar.dart';
import '../screens/quick_checkout_main_screen.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit() : super(CheckOutInitialState());
  BuildContext context = MyApp.navKey.currentState!.context;

  static CheckOutCubit get(BuildContext context) => BlocProvider.of(context);

  List<ShippingMethod>? shippingMethods;
  List<PaymentMethod>? paymentMethods;
  ShippingMethod? selectedShippingMethod;
  PaymentMethod? selectedPaymentMethod;

  AddAddressToOrderInput addAddressToOrderInput = AddAddressToOrderInput(
    firstName: "",
    lastName: "",
    address: '',
    country: null,
    city: '',
    region: null,
    postalCode: '',
  );
  GlobalKey<FormState> addAddressToOrderFormKey = GlobalKey<FormState>();

  TabController? tabController;
  String? selectedUserAddressId;
  Address? selectedUserAddress;
  List<Address>? userAddresses;



  createOrder(CartCubit cartCubit){

          // [
          //   {
          //     "Id": 5,
          //     "RequestDate": "2025-05-11T12:52:44.3784731",
          //     "RequestNumber": "20250511125244",
          //     "CustomerName": "ss22",
          //     "Status": 1
          //   }
          // ]
        var items =  cartCubit.cartItems?.entries.map((e)=>
        {
          "productSource": 1,
          "unitId": 5,
          "unitName": "قطعة",
          "productId": e.value["id"],
          "productName": e.value['name'],
          "qty": e.value['quantity']
        }
        )?.toList();

        print(items);

        emit(ConfirmOrderLoadingState());
        var response = CheckoutApis.createOrder(items: items);
        emit(ConfirmOrderSuccessState());

  }




  setShippingMethod(int index) {
    selectedShippingMethod = shippingMethods?[index];
    //emit(ShippingMethodSelected());
  }

  setPaymentMethod(int index) {
    selectedPaymentMethod = paymentMethods?[index];
    // emit(PaymentMethodSelected());
  }

  initCheckOutAuthScreen(TickerProvider tickerProvider) {
    tabController =
        TabController(initialIndex: 0, length: 3, vsync: tickerProvider);
    MyApp.navKey.currentState!.context.read<AuthCubit>().clearGuest();
  }

  initCheckoutForRegisteredUser() async {
    emit(InitializeCheckoutLoadingState());
    var getShippingMethodsSuccess = await getShippingMethods();

    if (getShippingMethodsSuccess == false) {
      emit(InitializeCheckoutFailedState());
      return;
    } else if (getShippingMethodsSuccess == null) {
      emit(InitializeCheckoutNetworkConnectionFailedState());
      return;
    }

    await setShippingMethod(0);

    var getPaymentMethodsSuccess = await getPaymentMethods();
    if (getPaymentMethodsSuccess == false) {
      emit(InitializeCheckoutFailedState());
      return;
    } else if (getPaymentMethodsSuccess == null) {
      emit(InitializeCheckoutNetworkConnectionFailedState());
      return;
    }

    await setPaymentMethod(0);
    emit(InitializeCheckoutSuccessState());
  }

  initCheckoutForGuest() async {
    emit(InitializeCheckoutLoadingState());

    var settingGuestShippingAddressSuccess = await setGuestShippingAddress();
    if (settingGuestShippingAddressSuccess == false) {
      emit(InitializeCheckoutFailedState());
      return;
    } else if (settingGuestShippingAddressSuccess == null) {
      emit(InitializeCheckoutNetworkConnectionFailedState());
      return;
    }

    var getShippingMethodsSuccess = await getShippingMethods();

    if (getShippingMethodsSuccess == false) {
      emit(InitializeCheckoutFailedState());
      return;
    } else if (getShippingMethodsSuccess == null) {
      emit(InitializeCheckoutNetworkConnectionFailedState());
      return;
    }

    await setShippingMethod(0);

    var getPaymentMethodsSuccess = await getPaymentMethods();
    if (getPaymentMethodsSuccess == false) {
      emit(InitializeCheckoutFailedState());
      return;
    } else if (getPaymentMethodsSuccess == null) {
      emit(InitializeCheckoutNetworkConnectionFailedState());
      return;
    }

    await setPaymentMethod(0);
    emit(InitializeCheckoutSuccessState());
  }

  setRegisteredUserPaymentAddresses() async {
    emit(GetUserAddressesLoadingState());
    var response = await CheckoutApis.getCustomerPaymentAddresses();
    if (response?.success == 1) {
      selectedUserAddressId = response?.data?.addressId;
      userAddresses = response?.data?.addresses;
      for (int i = 0; i < ((userAddresses?.length) ?? 0); i++) {
        if (userAddresses?[i].addressId == selectedUserAddressId) {
          selectedUserAddress = userAddresses?[i];
          userAddresses?.removeAt(i);
        }
      }

      emit(GetUserAddressesSuccessState());
    } else if (response?.success == 0) {
      userAddresses = null;
      emit(GetUserAddressesFailedState());
    } else {
      userAddresses = null;
      emit(GetUserAddressesNetworkConnectionFailedState());
    }
  }

  selectExistingUserAddress(String addressId) {
    selectedUserAddressId = addressId;
    emit(SelectUserAddressState());
  }

  setExistingUserAddress(CartCubit cartCubit) async {
    emit(SetExistingUserAddressLoadingState());
    var settingPaymentAddressResponse =
        await CheckoutApis.setExistingCustomerPaymentAddress(
            int.tryParse(selectedUserAddressId ?? "") ?? 0);
    var settingShippingAddressResponse =
        await CheckoutApis.setExistingCustomerShippingAddress(
            int.tryParse(selectedUserAddressId ?? "") ?? 0);

    if (settingPaymentAddressResponse?.success == true &&
        settingShippingAddressResponse?.success == true) {
      initCheckoutForRegisteredUser();
      Navigator.push(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: cartCubit,
                  child: BlocProvider.value(
                      value: this, child: const QuickCheckoutMainScreen())),
              type: PageTransitionType.leftToRight));
      // emit(SetExistingUserAddressSuccessState());
    } else if (settingPaymentAddressResponse?.success == false ||
        settingShippingAddressResponse?.success == false) {
      showAppSnackBar(content: settingShippingAddressResponse?.errorMsgs[0]);
      emit(SetExistingUserAddressFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(SetExistingUserAddressNetworkConnectionFailedState());
    }
  }

  Future<bool?> setGuestShippingAddress() async {
    GuestFormInput guestFormInput = AuthCubit.get(context).guestFormInput;
    var success = await CheckoutApis.setGuestShippingAddress(guestFormInput);
    if (success == true) {
      //emit(SetGuestShippingAddressSuccessState());
      return true;
    } else if (success == false) {
      showAppSnackBar(content: "Error occured");
      return false;
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      return null;
    }
  }

  Future<bool?> getShippingMethods() async {
    LocaleCubit localeCubit = LocaleCubit.get(context);
    AppSettingsCubit appSettingsCubit = AppSettingsCubit.get(context);

    var response = await CheckoutApis.getShippingMethods(
        languageCode: languageCodes[localeCubit.locale.languageCode] ?? "",
        currencyCode: appSettingsCubit.currencyCode ?? ""
    );
    if (response?.success == 1) {
      shippingMethods = response?.data?.shippingMethods;
      return true;
    } else if (response?.success == 0) {
      shippingMethods = null;
      return false;
    } else {
      shippingMethods = null;
      return null;
    }
  }

  Future<bool?> getPaymentMethods() async {
    var response = await CheckoutApis.getPaymentMethods();
    if (response?.success == 1) {
      paymentMethods = response?.data?.paymentMethods;
      return true;
    } else if (response?.success == 0) {
      paymentMethods = null;
      return false;
    } else {
      paymentMethods = null;
      return null;
    }
  }

  confirmOrder(CartCubit cartCubit) async {
    AppSettingsCubit appSettingsCubit = AppSettingsCubit.get(context);
    LocaleCubit localeCubit = LocaleCubit.get(context);
    emit(ConfirmOrderLoadingState());

    var setShippingMethodResponse = await setShippingMethodByApi();
    if (setShippingMethodResponse == false) {
      emit(ConfirmOrderFailedState());
      return;
    } else if (setShippingMethodResponse == null) {
      emit(ConfirmOrderNetworkConnectionFailedState());
      return;
    }

    var setPaymentMethodResponse = await setPaymentMethodByApi();
    if (setPaymentMethodResponse == false) {
      emit(ConfirmOrderFailedState());
      return;
    } else if (setPaymentMethodResponse == null) {
      emit(ConfirmOrderNetworkConnectionFailedState());
      return;
    }

    var isConfirmOrderSuccess = await CheckoutApis.confirmOrder(
        languageCode: languageCodes[localeCubit.locale.languageCode] ?? "",
        currencyCode: appSettingsCubit.currencyCode ?? ""

    );
    if (isConfirmOrderSuccess == true) {
      var isConfirmOrderAndEndSessionSuccess =
          await CheckoutApis.confirmOrderAndEndSession(
              languageCode: languageCodes[localeCubit.locale.languageCode] ?? "",
              currencyCode: appSettingsCubit.currencyCode ?? ""

          );
      if (isConfirmOrderAndEndSessionSuccess == true) {
        cartCubit.clearCart();
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: cartCubit, child: const OrderSuccessScreen()),
              type: PageTransitionType.leftToRight),
        );
        emit(ConfirmOrderSuccessState());
      } else if (isConfirmOrderAndEndSessionSuccess == false) {
        emit(ConfirmOrderFailedState());
        showAppSnackBar(content: "Error occured");
      } else {
        emit(ConfirmOrderNetworkConnectionFailedState());
        showAppSnackBar(
            content: "Check your internet connection, and try again");
      }
    } else if (isConfirmOrderSuccess == false) {
      emit(ConfirmOrderFailedState());
      showAppSnackBar(content: "Error occured");
    } else {
      emit(ConfirmOrderNetworkConnectionFailedState());
      showAppSnackBar(content: "Check your internet connection, and try again");
    }
  }

  Future<bool?> setShippingMethodByApi() async {
    var response =
        await CheckoutApis.setShippingMethod(selectedShippingMethod!,

        );
    if (response == true) {
      return true;
    } else if (response == false) {
      showAppSnackBar(content: "Error occurred");
      return false;
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      return null;
    }
  }

  Future<bool?> setPaymentMethodByApi() async {
    var response = await CheckoutApis.setPaymentMethod(selectedPaymentMethod!);
    if (response == true) {
      return true;
    } else if (response == false) {
      showAppSnackBar(content: "Error occurred");
      return false;
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      return null;
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

  Future<List<Region>> getRegions() async {
    var response = await GetCountriesAndRegionsApi.getRegionsByCountryId(
        addAddressToOrderInput.country?.countryId?.toInt() ?? 0);
    if (response?.success == 1) {
      return response?.data?.regions ?? [];
    } else {
      return [];
    }
  }

  setAddAddressCountry(Country country) {
    addAddressToOrderInput.country = country;
    addAddressToOrderInput.region = null;
    emit(SelectedCountryStateInAddAddressScreen());
  }

  setAddAddressRegion(Region region) {
    addAddressToOrderInput.region = region;
  }

  // setAccountDefaultAddress(bool state) {
  //   addAddressToOrderInput.isDefaultAddress = state;
  //   emit(DefaultAddressSelectedStateInAddAddressScreen());
  // }

  addAddressToOrder() async {
    addAddressToOrderFormKey.currentState?.save();
    var isFormValid = addAddressToOrderFormKey.currentState?.validate();
    if (isFormValid != true) {
      return;
    }
    addAddressToOrderFormKey.currentState?.save();
    emit(AddAddressToOrderLoadingState());
    var response =
        await CheckoutApis.addAddressToOrder(addAddressToOrderInput.toJson());
    if (response?.success == true) {
      setRegisteredUserPaymentAddresses();
      Navigator.pop(context);
      showAppSnackBar(content: "Address is added successfully");
      emit(AddAddressToOrderSuccessState());
    } else if (response?.success == false) {
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");
      emit(AddAddressToOrderFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(AddAddressToOrderNetworkConnectionFailedState());
    }
  }
}
