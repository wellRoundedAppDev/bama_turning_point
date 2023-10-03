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
