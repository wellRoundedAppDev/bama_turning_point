import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/cubit.dart';
import 'package:classic_eccomerce/wish_list/presentation/cubits/wish_list_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/get_wishlist_response.dart';
import '../widgets/wish_list_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..setWishListItems(),
      child: BlocConsumer<WishListCubit, WishListStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WishListCubit wishListCubit = WishListCubit.get(context);
          List<WishlistItem>? wishListItems = wishListCubit.wishListItems;
          return SafeArea(
              child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
              cartCubit: CartCubit.get(context),
                title: "My Wish List", showBackButton: false),
            body: (state is GetWishListLoadingState)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (state is GetWishListNetworkConnectionFailedState)
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: NoNetworkRefreshPage(refresh: () {
                          wishListCubit.setWishListItems();
                        }),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          await wishListCubit.setWishListItems();
                        },
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, bottom: 16, top: 24),
                          itemBuilder: (context, index) {
                            WishlistItem? wishlistItem = wishListItems?[index];
                            return WishListItemWidget(
                                wishlistItem: wishlistItem);
                          },
                          itemCount: wishListItems?.length ?? 0,
                        ),
                      ),
          ));
        },
      ),
    );
  }
}
