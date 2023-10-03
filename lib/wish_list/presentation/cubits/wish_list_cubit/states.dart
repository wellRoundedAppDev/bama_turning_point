abstract class WishListStates{}

class WishListInitialState extends WishListStates{}


class GetWishListLoadingState extends WishListStates{}

class GetWishListSuccessState extends WishListStates{}

class GetWishListFailedState extends WishListStates{}

class GetWishListNetworkConnectionFailedState extends WishListStates{}


class DeleteItemFromWishListLoadingState extends WishListStates{}

class DeleteItemFromWishListSuccessState extends WishListStates{}

class DeleteItemFromWishListFailedState extends WishListStates{}

class DeleteItemFromWishListNetworkConnectionFailedState extends WishListStates{}


// class ItemAddedToCartFromWishListLoadingState extends WishListStates{}
//
// class ItemAddedToCartSuccessState extends WishListStates{}
//
// class ItemAddedToCartFailedState extends WishListStates{}
//
// class ItemAddedToCartNetworkConnectionFailedState extends WishListStates{}
