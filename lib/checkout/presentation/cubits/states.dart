abstract class CheckOutStates {}

class CheckOutInitialState extends CheckOutStates{}

class InitializeCheckoutLoadingState extends CheckOutStates{}

class InitializeCheckoutSuccessState extends CheckOutStates{}

class InitializeCheckoutFailedState extends CheckOutStates{}

class InitializeCheckoutNetworkConnectionFailedState extends CheckOutStates{}



class SetGuestShippingAddressLoadingState extends CheckOutStates{}

class SetGuestShippingAddressSuccessState extends CheckOutStates{}

class SetGuestShippingAddressFailedState extends CheckOutStates{}

class SetGuestShippingAddressNetworkConnectionFailedState extends CheckOutStates{}


class ConfirmOrderLoadingState extends CheckOutStates{}

class ConfirmOrderSuccessState extends CheckOutStates{}

class ConfirmOrderFailedState extends CheckOutStates{}

class ConfirmOrderNetworkConnectionFailedState extends CheckOutStates{}


