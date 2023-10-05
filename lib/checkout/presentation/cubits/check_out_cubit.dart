import 'package:classic_eccomerce/authentication/data/models/guest_form_input.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/data/data_sources/checkout_apis.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_shipping_methods_response.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:classic_eccomerce/checkout/presentation/screens/order_success_screen.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../shared_components/app_snackbar.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit() : super(CheckOutInitialState());
  BuildContext context = MyApp.navKey.currentState!.context;

  static CheckOutCubit get(BuildContext context) => BlocProvider.of(context);

  List<ShippingMethod>? shippingMethods;
  List<PaymentMethod>? paymentMethods;
  ShippingMethod? selectedShippingMethod;
  PaymentMethod? selectedPaymentMethod;
  
  GlobalKey<FormState> addressForRegisteredUserFormkey = GlobalKey<FormState>();

  TabController? tabController;



  setShippingMethod(int index) {
    selectedShippingMethod = shippingMethods?[index];
    emit(ShippingMethodSelected());
  }

  setPaymentMethod(int index) {
    selectedPaymentMethod = paymentMethods?[index];
    emit(PaymentMethodSelected());
  }

  initCheckOutAuthScreen(TickerProvider tickerProvider) {
    tabController =
        TabController(initialIndex: 0, length: 3, vsync: tickerProvider);
    MyApp.navKey.currentState!.context.read<AuthCubit>().clearGuest();
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


  initCheckoutForRegisteredUser() async {
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
    var response = await CheckoutApis.getShippingMethods();
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

    var isConfirmOrderSuccess = await CheckoutApis.confirmOrder();
    if (isConfirmOrderSuccess == true) {
      var isConfirmOrderAndEndSessionSuccess =
          await CheckoutApis.confirmOrderAndEndSession();
      if (isConfirmOrderAndEndSessionSuccess == true) {
        cartCubit.clearCart();
        Navigator.pushReplacement(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: cartCubit, child: const OrderSuccessScreen()),
              type: PageTransitionType.leftToRight),
        );
        emit(ConfirmOrderSuccessState());
      }
      else if (isConfirmOrderAndEndSessionSuccess == false) {
        emit(ConfirmOrderFailedState());
        showAppSnackBar(content: "Error occured");
      }
      else {
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
        await CheckoutApis.setShippingMethod(selectedShippingMethod!);
    if (response == true) {
      return true;
    } else if (response == false) {
      showAppSnackBar(content: "Error occured");
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
      showAppSnackBar(content: "Error occured");
      return false;
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      return null;
    }
  }
  
  
}
