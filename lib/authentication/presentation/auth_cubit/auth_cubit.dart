import 'package:classic_eccomerce/authentication/data/data_sources/remote_data_sources/auth_apis.dart';
import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/authentication/data/models/login_form_input.dart';
import 'package:classic_eccomerce/authentication/data/models/login_response.dart';
import 'package:classic_eccomerce/authentication/data/models/register_form_input.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/core/data/data_sources/remote_data_sources/get_countries_api.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../checkout/presentation/screens/quick_checkout_main_screen.dart';
import '../../../core/helpers/dio_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;
  final dioHelper = DioHelper.instance;
  String? sessionId;
  String? accessToken;
  LoginResponse? loginResponse;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> guestFormKey = GlobalKey<FormState>();

  LoginFormInput loginFormInput = LoginFormInput();
  GuestFormInput guestFormInput = GuestFormInput();
  RegisterFormInput registerFormInput = RegisterFormInput();

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isGuestConfirmedBillingAndAddressMatch = false;

  bool isUserLoggedIn = false;

  Future<bool> setAccessToken() async {
    var response = await AuthApis.getAccessToken();
    if (response != null) {
      accessToken = response;
      // addSessionIdToHeader();
      return true;
    } else {
      return false;
    }
  }

  clearGuest() {
    isGuestConfirmedBillingAndAddressMatch = false;
    guestFormInput.clear();
  }

  login() async {
    if (validateLoginForm() != true) {
      return;
    }

    loginFormKey.currentState?.save();
    emit(LoginLoadingState());
    if (await setAccessToken() == false) {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(LoginNetworkFailedConnectionState());
      return;
    }

    var response = await AuthApis.login(loginFormInput.toJson());
    if (response?.success == 1) {
      loginResponse = response;
      isUserLoggedIn = true;
      emit(LoginSuccessState());
    } else if (response?.success == 0) {
      loginResponse = null;
      isUserLoggedIn = false;
      showAppSnackBar(content: response?.error?[0] ?? "");
      emit(LoginFailedState());
    } else {
      loginResponse = null;
      isUserLoggedIn = false;
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(LoginNetworkFailedConnectionState());
    }
  }

  register() async {
    if (validateRegisterForm() != true) {
      return;
    }

    registerFormKey.currentState?.save();
    emit(RegisterLoadingState());
    if (await setAccessToken() == false) {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(RegisterNetworkFailedConnectionState());
      return;
    }

    var response = await AuthApis.register(registerFormInput.toJsonForApi());
    if (response?.success == true) {
      isUserLoggedIn = true;
      emit(RegisterSuccessState());
      Navigator.pop(context);
    } else if (response?.success == false) {
      isUserLoggedIn = false;
      showAppSnackBar(content: response?.errorMsgs?[0] ?? "");
      emit(RegisterFailedState());
    } else {
      isUserLoggedIn = false;
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(RegisterNetworkFailedConnectionState());
    }
  }

  Future<void> logOut() async {
    // if (await setSessionId() == false) {
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(LogoutNetworkFailedConnectionState());
    //   return;
    // }
    var success = await AuthApis.logOut();
    if (success == true) {
      isUserLoggedIn = false;
      emit(LogoutSuccessState());
    } else if (success == false) {
      showAppSnackBar(content: "Error occured");
      emit(LogoutFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(LogoutNetworkFailedConnectionState());
    }
  }

  validateLoginForm() {
    return loginFormKey.currentState!.validate();
  }

  validateRegisterForm() {
    return registerFormKey.currentState!.validate();
  }

  addSessionIdToHeader() {
    dioHelper.addHeader("X-Oc-Session", sessionId);
  }

  Future<List<Country>> getCountries() async {
    var response = await GetCountriesAndRegionsApi.getCountries();
    if (response?.success == 1) {
      return response?.countries ?? [];
    } else {
      return [];
    }
  }

  setCountryOfGuest(Country country) {
    guestFormInput.country = country;
    guestFormInput.region = null;
    emit(SetCountryOfGuestState());
  }

  Future<List<Region>> getRegionOfGuest() async {
    var response = await GetCountriesAndRegionsApi.getRegionsByCountryId(
        guestFormInput.country?.countryId?.toInt() ?? 0);
    if (response?.success == 1) {
      return response?.data?.regions ?? [];
    } else {
      return [];
    }
  }

  setRegionOfGuest(Region region) {
    guestFormInput.region = region;
  }

  setIsGuestConfirmedBillingAndAddressMatchState(bool state) {
    isGuestConfirmedBillingAndAddressMatch = state;
    emit(GuestCheckingOnMyDeliveryAndAddressAreTheSame());
  }

  validateGuestCheckoutForm() {
    if (guestFormKey.currentState!.validate() == true &&
        guestFormInput.country != null &&
        guestFormInput.region != null &&
        isGuestConfirmedBillingAndAddressMatch == true) {
      return true;
    }
    return false;
  }

  Future<bool?> createGuestUser(
      CartCubit cartCubit, CheckOutCubit checkOutCubit) async {
    if (validateGuestCheckoutForm() == false) {
      return null;
    }

    guestFormKey.currentState?.save();

    emit(CreatingGuestUserLoadingState());
    if (await setAccessToken() == true) {
      var addItemsToCartSuccess = await cartCubit.addItemsToCart();
      if (addItemsToCartSuccess == true) {
        var createGuestUserSuccess = await AuthApis.createGuestUser(
            guestFormInput.toJsonForCreateGuestApi());
        if (createGuestUserSuccess == true) {
          Navigator.push(
              context,
              PageTransition(
                  child: BlocProvider.value(
                      value: checkOutCubit..initCheckoutForGuest(),
                      child: BlocProvider.value(
                          value: cartCubit,
                          child: const QuickCheckoutMainScreen())),
                  type: PageTransitionType.leftToRight));
        //  MyApp.navKey.currentState!.context.read<AuthCubit>().clearGuest();
          emit(CreatingGuestUserSuccessState());
          return true;
        } else if (createGuestUserSuccess == false) {
          showAppSnackBar(content: "Error occured");
          emit(CreatingGuestUserFailedState());
          return false;
        } else {
          showAppSnackBar(
              content: "Check your internet connection, and try again");
          emit(CreatingGuestUserNetworkConnectionFailedState());
          return null;
        }
      } else if (addItemsToCartSuccess == false) {
        //todo add snackbar
        emit(CreatingGuestUserFailedState());
        showAppSnackBar(content: "Error occured");

        return false;
      } else {
        //todo add snackbar
        emit(CreatingGuestUserNetworkConnectionFailedState());
        showAppSnackBar(
            content: "Check your internet connection, and try again");

        return null;
      }
    } else {
      emit(CreatingGuestUserNetworkConnectionFailedState());
      showAppSnackBar(content: "Check your internet connection, and try again");
      return null;
    }
  }
}
