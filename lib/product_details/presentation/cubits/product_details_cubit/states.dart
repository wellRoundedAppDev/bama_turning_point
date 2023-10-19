abstract class ProductDetailsStates {}

class ProductDetailsInitialState extends ProductDetailsStates {}

class GetProductDetailsLoadingState extends ProductDetailsStates {}

class GetProductDetailsSuccessState extends ProductDetailsStates {}

class GetProductDetailsFailedState extends ProductDetailsStates {}

class GetProductDetailsNetworkConnectionFailedState
    extends ProductDetailsStates {}

class ChangeSliderCurrentIndexState extends ProductDetailsStates {}



class AddItemToFavoritesLoadingState extends ProductDetailsStates {}

class AddItemToFavoritesSuccessState extends ProductDetailsStates {}

class AddItemToFavoritesFailedState extends ProductDetailsStates {}

class AddItemToFavoritesNetworkConnectionFailedState
    extends ProductDetailsStates {}


class GetRelatedProductsLoadingState extends ProductDetailsStates {}

class GetRelatedProductsSuccessState extends ProductDetailsStates {}

class GetRelatedProductsFailedState extends ProductDetailsStates {}

class GetRelatedProductsNetworkConnectionFailedState extends ProductDetailsStates {}

