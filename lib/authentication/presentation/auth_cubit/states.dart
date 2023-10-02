abstract class AuthStates{}

class AuthInitialState extends AuthStates{}


class LoginLoadingState extends AuthStates{}

class LoginSuccessState extends AuthStates{}

class LoginFailedState extends AuthStates{}

class LoginNetworkFailedConnectionState extends AuthStates{}


class RegisterLoadingState extends AuthStates{}

class RegisterSuccessState extends AuthStates{}

class RegisterFailedState extends AuthStates{}

class RegisterNetworkFailedConnectionState extends AuthStates{}



class LogoutLoadingState extends AuthStates{}

class LogoutSuccessState extends AuthStates{}

class LogoutFailedState extends AuthStates{}

class LogoutNetworkFailedConnectionState extends AuthStates{}



class SetCountryOfGuestState extends AuthStates{}

class GuestCheckingOnMyDeliveryAndAddressAreTheSame extends AuthStates{}


class CreatingGuestUserLoadingState extends AuthStates{}

class CreatingGuestUserSuccessState extends AuthStates{}

class CreatingGuestUserFailedState extends AuthStates{}

class CreatingGuestUserNetworkConnectionFailedState extends AuthStates{}