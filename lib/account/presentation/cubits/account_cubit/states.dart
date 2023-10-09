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
