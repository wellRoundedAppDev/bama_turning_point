abstract class AuthStates{}

class AuthInitialState extends AuthStates{}


class LoginLoadingState extends AuthStates{}

class LoginSuccessState extends AuthStates{}

class LoginFailedState extends AuthStates{}

class LoginNetworkFailedConnectionState extends AuthStates{}


class SetCountryOfGuestState extends AuthStates{}

class GuestCheckingOnMyDeliveryAndAddressAreTheSame extends AuthStates{}