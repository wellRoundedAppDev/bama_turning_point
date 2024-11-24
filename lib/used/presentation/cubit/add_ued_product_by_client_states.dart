abstract class AddUsedProductByClientStates {}

class AddUsedProductByClientInitialState extends AddUsedProductByClientStates {}




class AddUsedProductByClientLoadingState extends AddUsedProductByClientStates {}

class AddUsedProductByClientSuccessState extends AddUsedProductByClientStates {}

class AddUsedProductByClientFailedState extends AddUsedProductByClientStates {}

class AddUsedProductByClientNetworkConnectionFailedState extends AddUsedProductByClientStates {}




class GetCategoriesLoadingState extends AddUsedProductByClientStates {}

class GetCategoriesSuccessState extends AddUsedProductByClientStates {}

class GetCategoriesFailedState extends AddUsedProductByClientStates {}

class GetCategoriesNetworkConnectionFailedState extends AddUsedProductByClientStates {}


class SetSelectedCategoryState extends AddUsedProductByClientStates{}

class PickImageState extends AddUsedProductByClientStates{}


class RemoveImageState extends AddUsedProductByClientStates{}