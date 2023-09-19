import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/account/presentation/screens/my_account_screen.dart';
import 'package:classic_eccomerce/authentication/data/data_sources/remote_data_sources/auth_apis.dart';
import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/authentication/data/models/login_form_input.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/core/data/data_sources/remote_data_sources/get_countries_api.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:classic_eccomerce/main.dart';
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

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> guestFormKey = GlobalKey<FormState>();

  LoginFormInput loginFormInput = LoginFormInput();
  GuestFormInput guestFormInput = GuestFormInput();

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isGuestConfirmedBillingAndAddressMatch = false;

  bool isUserLoggedIn = false;

  Future<bool> setSessionId() async {
    var response = await AuthApis.getSessionId();
    if (response != null) {
      sessionId = response;
      // addSessionIdToHeader();
      return true;
    } else {
      return false;
    }
  }

  login() async {
    if (validateLoginForm() != true) {
      return;
    }
    loginFormKey.currentState?.save();
    emit(LoginLoadingState());
    var success = await AuthApis.login(loginFormInput.toJson());
    if (success == true) {
      isUserLoggedIn = true;
      emit(LoginSuccessState());
    } else if (success == false) {
      isUserLoggedIn = false;
      emit(LoginFailedState());
    } else {
      isUserLoggedIn = false;
      emit(LoginNetworkFailedConnectionState());
    }
  }

  validateLoginForm() {
    return loginFormKey.currentState!.validate();
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

  Future<bool?> createGuestUser(CartCubit cartCubit) async {
    if (validateGuestCheckoutForm() == false) {
      return null;
    }
    guestFormKey.currentState?.save();

    if (await setSessionId() == true) {
      var addItemsToCartSuccess = await cartCubit.addItemsToCart();
      if (addItemsToCartSuccess == true) {
        var createGuestUserSuccess = await AuthApis.createGuestUser(
            guestFormInput.toJsonForCreateGuestApi());
        if (createGuestUserSuccess == true) {
          Navigator.push(
              context,
              PageTransition(
                  child: const QuickCheckoutMainScreen(),
                  type: PageTransitionType.leftToRight));
          return true;
        } else if (createGuestUserSuccess == false) {
          //todo add snackbar

          return false;
        } else {
          //todo add snackbar

          return null;
        }
      } else if (addItemsToCartSuccess == false) {
        //todo add snackbar

        return false;
      } else {
        //todo add snackbar

        return null;
      }
    } else {
      //todo add snackbar
      return null;
    }
  }
}
