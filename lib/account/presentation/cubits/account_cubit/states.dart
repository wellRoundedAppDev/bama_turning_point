abstract class AccountStates {}

class AccountInitialState extends AccountStates {}

class GetAccountLoadingState extends AccountStates {}

class GetAccountSuccessState extends AccountStates {}

class GetAccountFailedState extends AccountStates {}

class GetAccountNetworkConnectionFailedState extends AccountStates {}

class EditAccountLoadingState extends AccountStates {}

class EditAccountSuccessState extends AccountStates {}

class EditAccountFailedState extends AccountStates {}

class EditAccountNetworkConnectionFailedState extends AccountStates {}

class ChangeAccountPasswordLoadingState extends AccountStates {}

class ChangeAccountPasswordSuccessState extends AccountStates {}

class ChangeAccountPasswordFailedState extends AccountStates {}

class ChangeAccountPasswordNetworkConnectionFailedState extends AccountStates {}

class GetAccountAddressesLoadingState extends AccountStates {}

class GetAccountAddressesSuccessState extends AccountStates {}

class GetAccountAddressesFailedState extends AccountStates {}

class GetAccountAddressesNetworkConnectionFailedState extends AccountStates {}


class AddAddressLoadingState extends AccountStates{}

class AddAddressSuccessState extends AccountStates{}

class AddAddressFailedState extends AccountStates{}

class AddAddressNetworkConnectionFailedState extends AccountStates{}


class EditAddressLoadingState extends AccountStates{}

class EditAddressSuccessState extends AccountStates{}

class EditAddressFailedState extends AccountStates{}

class EditAddressNetworkConnectionFailedState extends AccountStates{}



class DeleteAddressLoadingState extends AccountStates{}

class DeleteAddressSuccessState extends AccountStates{}

class DeleteAddressFailedState extends AccountStates{}

class DeleteAddressNetworkConnectionFailedState extends AccountStates{}


class GetCustomerOrdersLoadingState extends AccountStates{}

class  GetCustomerOrdersSuccessState extends AccountStates{}

class  GetCustomerOrdersFailedState extends AccountStates{}

class GetCustomerOrdersNetworkConnectionFailedState extends AccountStates{}


class GetOrderDetailsLoadingState extends AccountStates{}

class GetOrderDetailsSuccessState extends AccountStates{}

class GetOrderDetailsFailedState extends AccountStates{}

class GetOrderDetailsNetworkConnectionFailedState extends AccountStates{}



class AccountAddressSelectedState extends AccountStates{}

class DefaultAddressSelectedState extends AccountStates{}