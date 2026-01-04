import 'package:classic_eccomerce/authentication/data/data_sources/local_data_source/login_credentials_store.dart';
import 'package:classic_eccomerce/authentication/data/data_sources/remote_data_sources/auth_apis.dart';
import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/authentication/data/models/login_form_input.dart';
import 'package:classic_eccomerce/authentication/data/models/login_response.dart';
import 'package:classic_eccomerce/authentication/data/models/register_form_input.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/login_screen.dart';
import 'package:classic_eccomerce/core/data/data_sources/remote_data_sources/get_countries_api.dart';
import 'package:classic_eccomerce/core/data/models/get_countries_response.dart';
import 'package:classic_eccomerce/core/data/models/get_regions_response.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/profile/profile_screen.dart';
import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
import 'package:classic_eccomerce/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../core/constants/server_urls_and_keys/api_urls.dart';
import '../../../core/helpers/dio_helper.dart';
import '../../../core/locales/l10n/app_localizations.dart';
import '../../../home_layout/presentation/screens/home_layout.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  BuildContext context = MyApp.navKey.currentState!.context;
  DioHelper?  dioHelper;
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
    if (response == null) {
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

  loginFromLoginForm({
    bool isCheckingOut = false,
  }) async {

    AuthApis apis = AuthApis(DioHelper()..init(ApiUrls.BASE_URL));

//var response = await apis.getGeoFences(baseUrl);

 //   dioHelper = DioHelper()..init(ApiUrls.BASE_URL);
    if (validateLoginForm() != true) {
      return;
    }

    loginFormKey.currentState?.save();

    // if (await setAccessToken() == false) {
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(LoginNetworkFailedConnectionState());
    //   return;
    // }

    emit(LoginLoadingState());
    var response = await apis?.login(loginFormInput.toJson());
    if (response?.success == true) {
      loginResponse = response;
      isUserLoggedIn = true;
      // cartCubit.numberOfItemsInCart =
      //     loginResponse?.loginData?.cartCountProducts ?? 0;

      accessToken = response?.loginData?.token;
      setLoginCredentialsInSharedPrefs({
        "userName": loginFormInput.username,
        "password": loginFormInput.password,
        "baseUrl":ApiUrls.BASE_URL
      });


      emit(LoginSuccessState());

      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const PersonalProfileScreen(),
              type: PageTransitionType.leftToRight));

      if (kDebugMode) {
        print("token:${loginResponse?.loginData?.token}");
      }
      // Navigator.pushReplacement(
      //     context,
      //     PageTransition(
      //         child: const HomeLayoutScreen(),
      //         type: PageTransitionType.fade));
      // Navigator.pop(context);
    } else if (response?.success == false) {
      loginResponse = null;
      isUserLoggedIn = false;
      accessToken = null;
      showAppSnackBar(content: response?.error ?? "");
      if (kDebugMode) {
        print(response?.error);
      }
      emit(LoginFailedState());
    } else {
      loginResponse = null;
      isUserLoggedIn = false;
      accessToken = null;

      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);
      emit(LoginNetworkFailedConnectionState());
    }
  }

  login({
    required dynamic loginInput,
  }) async {
    // if (await setAccessToken() == false) {
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(LoginNetworkFailedConnectionState());
    //   return;
    // }

    AuthApis apis = AuthApis(DioHelper()..init(ApiUrls.BASE_URL));

    var response = await apis.login(loginInput);
    if (response?.success == true) {
      loginResponse = response;
      isUserLoggedIn = true;
      // cartCubit.numberOfItemsInCart =
      //     loginResponse?.loginData?.cartCountProducts ?? 0;

      accessToken = response?.loginData?.token;
      setLoginCredentialsInSharedPrefs({
        "userName": loginInput['userName'],
        "password": loginInput['password'],
        "baseUrl":ApiUrls.BASE_URL

      });
      // Navigator.pushReplacement(
      //     context,
      //     PageTransition(
      //         child: const HomeLayoutScreen(),
      //         type: PageTransitionType.fade));
      // Navigator.pop(context);
      emit(LoginSuccessState());
    } else if (response?.success == false) {
      loginResponse = null;
      isUserLoggedIn = false;
      accessToken = null;
      showAppSnackBar(content: response?.error ?? "");
      if (kDebugMode) {
        print(response?.error);
      }
      emit(LoginFailedState());
    } else {
      loginResponse = null;
      isUserLoggedIn = false;
      accessToken = null;

      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);
      emit(LoginNetworkFailedConnectionState());
    }
  }

  autoLogin() async {
    // Future.delayed(
    //   const Duration(seconds: 3),
    //       () => Navigator.pushReplacement(
    //       context,
    //       PageTransition(
    //           child: const HomeLayoutScreen(),
    //           type: PageTransitionType.fade)),
    // );
    //

    var loggedUser = (await getLoginCredentialsFromSharedPrefs());
    if (loggedUser == null) {
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: SignInScreen(), type: PageTransitionType.fade)),
      );

      return;
    }

    var loginInput = {
      "userName": loggedUser['userName'],
      "password": loggedUser['password'],
      //"baseUrl":loggedUser['baseUrl'],

    };

    ApiUrls.BASE_URL = loggedUser['baseUrl'];
    AuthApis apis = AuthApis(DioHelper()..init(ApiUrls.BASE_URL));

    // if (await setAccessToken() == false) {
    //   Navigator.pushReplacement(
    //       context,
    //       PageTransition(
    //           child: const HomeLayoutScreen(), type: PageTransitionType.fade));
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(LoginNetworkFailedConnectionState());
    //   return;
    // }

    var response = await apis?.login(loginInput);
    if (response?.success == true) {
      loginResponse = response;
      isUserLoggedIn = true;
      accessToken = loginResponse?.loginData?.token;
      // cartCubit.numberOfItemsInCart =
      //     loginResponse?.loginData?.cartCountProducts ?? 0;

      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const PersonalProfileScreen(), type: PageTransitionType.fade));
      emit(LoginSuccessState());
    } else if (response?.success == false) {
      loginResponse = null;
      isUserLoggedIn = false;
      showAppSnackBar(content: response?.error ?? "");
      print(response?.error);
      emit(LoginFailedState());
    } else {
      loginResponse = null;
      isUserLoggedIn = false;
      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);
      emit(LoginNetworkFailedConnectionState());
    }
  }

  // register({required CartCubit cartCubit}) async {
  //   if (validateRegisterForm() != true) {
  //     return;
  //   }
  //
  //   registerFormKey.currentState?.save();
  //   emit(RegisterLoadingState());
  //   if (await setAccessToken() == false) {
  //     showAppSnackBar(content: "Check your internet connection, and try again");
  //     emit(RegisterNetworkFailedConnectionState());
  //     return;
  //   }
  //
  //   var response = await AuthApis.register(registerFormInput.toJsonForApi());
  //   if (response?.success == true) {
  //     // isUserLoggedIn = true;
  //     await login(loginInput: {
  //       "email": registerFormInput.phoneNumber,
  //       "password": registerFormInput.password
  //     }, cartCubit: cartCubit);
  //     emit(RegisterSuccessState());
  //     Navigator.pop(context);
  //   } else if (response?.success == false) {
  //     // isUserLoggedIn = false;
  //
  //     showAppSnackBar(
  //         content: response?.errorMsgs != null &&
  //                 response?.errorMsgs != [] &&
  //                 response?.errorMsgs != ""
  //             ? (response?.errorMsgs?[0] ?? "") == "Email already exists!"
  //                 ? AppLocalizations.of(context)!.phone_number_already_exists
  //                 : AppLocalizations.of(context)!.error_occurred_try_again
  //             : "");
  //     emit(RegisterFailedState());
  //   } else {
  //     // isUserLoggedIn = false;
  //     showAppSnackBar(content: "Check your internet connection, and try again");
  //     emit(RegisterNetworkFailedConnectionState());
  //   }
  // }
  register() async {

    AuthApis apis = AuthApis(DioHelper()..init(ApiUrls.BASE_URL));

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

    var response = await apis?.register(registerFormInput.toJsonForApi());
    if (response?.success == true) {
      isUserLoggedIn = true;
      await login(
        loginInput: {
          "UserName": registerFormInput.userName,
          "Password": registerFormInput.password
        },
      );
      Navigator.pop(context);
      emit(RegisterSuccessState());
    } else if (response?.success == false) {
      // isUserLoggedIn = false;

      showAppSnackBar(content: (response?.message ?? ""));
      emit(RegisterFailedState());
    } else {
      // isUserLoggedIn = false;
      showAppSnackBar(
          content: AppLocalizations.of(context)!
              .check_your_internet_connection_and_try_again_later);
      emit(RegisterNetworkFailedConnectionState());
    }
  }

  Future<void> logOut() async {
    isUserLoggedIn = false;
    // cartCubit?.clearCart();
    clearLoginCredentialsFromSharedPrefs();
    accessToken = null;

    emit(LogoutSuccessState());
    Navigator.pushReplacement(context, PageTransition(child: SignInScreen() , type: PageTransitionType.leftToRight));
    return;
    // if (await setSessionId() == false) {
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(LogoutNetworkFailedConnectionState());
    //   return;
    // }
    // var success = await AuthApis.logOut();
    // if (success == true) {
    //   isUserLoggedIn = false;
    //   // cartCubit?.clearCart();
    //   clearLoginCredentialsFromSharedPrefs();
    //   emit(LogoutSuccessState());
    // } else if (success == false) {
    //   showAppSnackBar(content: "Error occured");
    //   emit(LogoutFailedState());
    // } else {
    //   showAppSnackBar(content: "Check your internet connection, and try again");
    //   emit(LogoutNetworkFailedConnectionState());
    // }
  }

  validateLoginForm() {
    return loginFormKey.currentState!.validate();
  }

  validateRegisterForm() {
    return registerFormKey.currentState!.validate();
  }

  addSessionIdToHeader() {
   // dioHelper.addHeader("X-Oc-Session", sessionId);
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
        guestFormInput.country?.countryId?.toInt() ?? 102);
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
    if (guestFormKey.currentState!.validate() == true
        //&&
        //   guestFormInput.country != null &&
        //    guestFormInput.region != null
        ) {
      return true;
    }
    return false;
  }

  // checkIfUserExists(var input) async {
  //   if (await setAccessToken() == false) {
  //     showAppSnackBar(
  //         content: AppLocalizations.of(context)!
  //             .check_your_internet_connection_and_try_again_later);
  //
  //     return false;
  //   }
  //
  //   var response = await AuthApis.login(input);
  //   if (response?.success == 1) {
  //     return true;
  //   } else if (response?.success == 0) {
  //     return false;
  //   } else {
  //     showAppSnackBar(
  //         content: AppLocalizations.of(context)!
  //             .check_your_internet_connection_and_try_again_later);
  //
  //     return null;
  //   }
  // }

// Future<bool?> createGuestUser(
//     ) async {
//   if (validateGuestCheckoutForm() == false) {
//     return null;
//   }
//
//   guestFormKey.currentState?.save();
//
//   guestFormInput?.country = Country(countryId: 102);
//
//   emit(CreatingGuestUserLoadingState());
//   if (await setAccessToken() == true) {
//     var addItemsToCartSuccess = await cartCubit.addItemsToCart();
//     if (addItemsToCartSuccess == true) {
//       var createGuestUserSuccess = await AuthApis.createGuestUser(
//           guestFormInput.toJsonForCreateGuestApi());
//       if (createGuestUserSuccess == true) {
//         Navigator.push(
//             context,
//             PageTransition(
//                 child: BlocProvider.value(
//                     value: checkOutCubit..initCheckoutForGuest(),
//                     child: BlocProvider.value(
//                         value: cartCubit,
//                         child: const QuickCheckoutMainScreen())),
//                 type: PageTransitionType.leftToRight));
//         //  MyApp.navKey.currentState!.context.read<AuthCubit>().clearGuest();
//         emit(CreatingGuestUserSuccessState());
//         return true;
//       } else if (createGuestUserSuccess == false) {
//         showAppSnackBar(
//             content: AppLocalizations.of(context)!.error_occurred_try_again);
//         emit(CreatingGuestUserFailedState());
//         return false;
//       } else {
//         showAppSnackBar(
//             content: AppLocalizations.of(context)!
//                 .check_your_internet_connection_and_try_again_later);
//         emit(CreatingGuestUserNetworkConnectionFailedState());
//         return null;
//       }
//     } else if (addItemsToCartSuccess == false) {
//       //todo add snackbar
//       emit(CreatingGuestUserFailedState());
//       showAppSnackBar(content: "Error occured");
//
//       return false;
//     } else {
//       //todo add snackbar
//       emit(CreatingGuestUserNetworkConnectionFailedState());
//       showAppSnackBar(
//           content: "Check your internet connection, and try again");
//
//       return null;
//     }
//   } else {
//     emit(CreatingGuestUserNetworkConnectionFailedState());
//     showAppSnackBar(content: "Check your internet connection, and try again");
//     return null;
//   }
// }
}
