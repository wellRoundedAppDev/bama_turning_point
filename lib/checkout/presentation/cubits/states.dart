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


class ShippingMethodSelected extends CheckOutStates{}

class PaymentMethodSelected extends CheckOutStates{}



class GetUserAddressesLoadingState extends CheckOutStates{}

class GetUserAddressesSuccessState extends CheckOutStates{}

class GetUserAddressesFailedState extends CheckOutStates{}

class GetUserAddressesNetworkConnectionFailedState extends CheckOutStates{}


class SetExistingUserAddressLoadingState extends CheckOutStates{}

class SetExistingUserAddressSuccessState extends CheckOutStates{}

class SetExistingUserAddressFailedState extends CheckOutStates{}

class SetExistingUserAddressNetworkConnectionFailedState extends CheckOutStates{}


class SelectUserAddressState extends CheckOutStates{}