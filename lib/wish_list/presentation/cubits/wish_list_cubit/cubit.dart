import 'package:classic_eccomerce/wish_list/data/data_sources/remote_data_sources/wish_list_apis.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/get_wishlist_response.dart';

class WishListCubit extends Cubit<WishListStates>{

  WishListCubit():super(WishListInitialState());

  static WishListCubit get(context) => BlocProvider.of(context);

  List<WishlistItem>? wishListItems;

  setWishListItems() async {
    emit(GetWishListLoadingState());
    var response = await WishListApis.getWishlist();
    if(response?.success == 1){
      wishListItems = response?.wishListItems;
      emit(GetWishListSuccessState());
    }else if(response?.success == 0){
      wishListItems = null;
      emit(GetWishListFailedState());
    }else{

      wishListItems = null;
      emit(GetWishListNetworkConnectionFailedState());
    }
  }



}