abstract class CartStates{}

class InitialCartState extends CartStates{}

class ItemAddedToCartLoadingState extends CartStates{}

class ItemAddedToCartSuccessState extends CartStates{}

class ItemAddedToCartFailedState extends CartStates{}

class ItemAddedToCartNetworkConnectionFailedState extends CartStates{}

class ItemAddedToCartState extends CartStates{}

class ItemDeletedFromCartState extends CartStates{}

class ItemQuantityIncreasedInCartState extends CartStates{}

class ItemQuantityDecreasedFromCartState extends CartStates{}

class OrderInCartConfirmedState extends CartStates{}

class CartIsClearedState extends CartStates{}


class LoadCartLoadingState extends CartStates{}

class LoadCartSuccessState extends CartStates{}

class LoadCartFailedState extends CartStates{}

class LoadCartNetworkConnectionFailedState extends CartStates{}