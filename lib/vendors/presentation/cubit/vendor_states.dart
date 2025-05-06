abstract class VendorsStates {}

class VendorsInitialState extends VendorsStates {}

class VendorsLoadingState extends VendorsStates{}

class VendorsSuccessState extends VendorsStates{}

class VendorsFailedState extends VendorsStates{}

class VendorsNetworkConnectionFailedState extends VendorsStates{}

class FetchingAllVendorProductsLoadingState extends VendorsStates {}

class FetchingAllVendorProductsSuccessState extends VendorsStates {}

class FetchingAllVendorProductsFailedState extends VendorsStates {}

class FetchingAllVendorProductsNetworkConnectionFailedState extends VendorsStates {}
