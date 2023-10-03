import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/data/data_sources/remote_data_sources/wish_list_apis.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared_components/app_snackbar.dart';
import '../../../data/models/get_wishlist_response.dart';

class WishListCubit extends Cubit<WishListStates> {
  WishListCubit() : super(WishListInitialState());

  static WishListCubit get(context) => BlocProvider.of(context);

  List<WishlistItem>? wishListItems;
  int? selectedProductId;
  CartCubit? cartCubit;

  init(CartCubit cartCubit){
    this.cartCubit = cartCubit;
    setWishListItems();
  }
  setWishListItems() async {
    emit(GetWishListLoadingState());
    var response = await WishListApis.getWishlist();
    if (response?.success == 1) {
      wishListItems = response?.wishListItems;
      emit(GetWishListSuccessState());
    } else if (response?.success == 0) {
      wishListItems = null;
      emit(GetWishListFailedState());
    } else {
      wishListItems = null;
      emit(GetWishListNetworkConnectionFailedState());
    }
  }

  setSelectedProductId(int? productId){
    selectedProductId = productId;
  }

  addItemToCart(){

  }

  deleteItemFromWishList(int? productId) async {
    setSelectedProductId(productId);
    if (productId == null) {
      showAppSnackBar(content: "Error occured");
      return;
    }
    emit(DeleteItemFromWishListLoadingState());
    var response = await WishListApis.deleteItemFromWishlist(productId);
    if (response == true) {
      showAppSnackBar(content: "Product removed from wishlist");
      setWishListItems();
    } else if (response == false) {
      showAppSnackBar(content: "Error occured");
      emit(DeleteItemFromWishListFailedState());
    } else {
      showAppSnackBar(content: "Check your internet connection, and try again");
      emit(DeleteItemFromWishListNetworkConnectionFailedState());
    }
  }

}
