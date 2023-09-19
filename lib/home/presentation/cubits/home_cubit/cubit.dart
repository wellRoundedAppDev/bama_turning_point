import 'dart:async';
import 'package:classic_eccomerce/authentication/data/data_sources/remote_data_sources/auth_apis.dart';
import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_slide_shows_api.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
import 'package:classic_eccomerce/home/data/models/get_best_sellers_response.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:classic_eccomerce/home/data/models/product.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:classic_eccomerce/home/presentation/screens/view_all_products_screen.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../categories/data/models/get_categories_response.dart';
import '../../../data/models/get_slide_shows_response.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;

  //data
  List<BannerAd>? banners;
  List<Category>? categoriesOverview;
  List<Category>? allCategories;
  List<Product>? allProducts;
  List<FeaturedProduct>? featuredProductsOverview;
  // List<FeaturedProduct>? allFeaturedProducts;
  List<LatestProduct>? newArrivalsProductsOverview;
  //List<LatestProduct>? allNewArrivals;
  List<BestSeller>? bestSellersProductsOverview;
  //List<BestSeller>? allBestSellersProducts;

  PageController adsSliderController = PageController();
  Timer? adsSliderTimer;

  animateAdsSlider() {
    adsSliderTimer?.cancel();
    adsSliderTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      print("tick tock");
      adsSliderController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.easeIn);
    });
  }

  setBanners() async {
    var response = await GetSlideShowsApi.getSlideShows();
    if (response?.success == 1) {
      banners = response?.slideShows?[0].bannerAds;
    } else if (response?.success == 0) {
      banners = null;
    } else {
      banners = null;
    }
  }

  navigateToViewAllProductsScreen(
      String productsListTitle, CartCubit cartCubit) {
    if (productsListTitle == "Featured Products") {
      loadViewAllProductsScreen(productsListTitle);
      Navigator.push(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: this,
                  child: BlocProvider.value(
                    value: cartCubit,
                    child: ViewAllProductsScreen(
                      productTitle: productsListTitle,
                    ),
                  )),
              type: PageTransitionType.leftToRight));
    } else if (productsListTitle == "New Arrivals") {
      loadViewAllProductsScreen(productsListTitle);
      Navigator.push(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: this,
                  child: BlocProvider.value(
                    value: cartCubit,
                    child: ViewAllProductsScreen(
                      productTitle: productsListTitle,
                    ),
                  )),
              type: PageTransitionType.leftToRight));
    } else {
      loadViewAllProductsScreen(productsListTitle);
      Navigator.push(
          context,
          PageTransition(
              child: BlocProvider.value(
                  value: this,
                  child: BlocProvider.value(
                    value: cartCubit,
                    child: ViewAllProductsScreen(
                      productTitle: productsListTitle,
                    ),
                  )),
              type: PageTransitionType.leftToRight));
    }
  }

  loadViewAllProductsScreen(String productsListTitle) {
    if (productsListTitle == "Featured Products") {
      setAllFeaturedProducts();
    } else if (productsListTitle == "New Arrivals") {
      setAllNewArrivalsProducts();
    } else {
      setAllBestSellersProducts();
    }
  }

  setFeaturedProductsOverview() async {
    var response = await ProductsApis.getFeaturedProductsOverview();
    if (response?.success == 1) {
      featuredProductsOverview = response?.data?[0].products;
    } else if (response?.success == 0) {
      featuredProductsOverview = null;
    } else {
      featuredProductsOverview = null;
    }
  }

  setNewArrivalsOverview() async {
    var response = await ProductsApis.getNewArrivalsProductsOverview();
    if (response?.success == 1) {
      newArrivalsProductsOverview = response?.latestProducts;
    } else if (response?.success == 0) {
      newArrivalsProductsOverview = null;
    } else {
      newArrivalsProductsOverview = null;
    }
  }

  setBestSellersOverview() async {
    var response = await ProductsApis.getBestSellersOverview();
    if (response?.success == 1) {
      bestSellersProductsOverview = response?.bestSellers;
    } else if (response?.success == 0) {
      bestSellersProductsOverview = null;
    } else {
      bestSellersProductsOverview = null;
    }
  }

  setCategoriesOverview() async {
    var response = await CategoriesApis.getCategories(1);
    if (response?.success == 1) {
      categoriesOverview = response?.categories;
    } else if (response?.success == 0) {
      categoriesOverview = null;
    } else {
      categoriesOverview = null;
    }
  }

  setAllFeaturedProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getFeaturedProducts();
    if (response?.success == 1) {
      allProducts = response?.data?[0].products;
      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  setAllNewArrivalsProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getNewArrivalsProducts();
    if (response?.success == 1) {
      allProducts = response?.latestProducts;
      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  setAllBestSellersProducts() async {
    emit(FetchingAllProductsLoadingState());
    var response = await ProductsApis.getBestSellersProducts();
    if (response?.success == 1) {
      allProducts = response?.bestSellers;
      emit(FetchingAllProductsSuccessState());
    } else if (response?.success == 0) {
      allProducts = null;
      emit(FetchingAllProductsFailedState());
    } else {
      allProducts = null;
      emit(FetchingAllProductsNetworkConnectionFailedState());
    }
  }

  init() async {
    emit(FetchingHomeScreenLoadingState());
    await setBanners();
    await setCategoriesOverview();
    await setFeaturedProductsOverview();
    await setNewArrivalsOverview();
    await setBestSellersOverview();
    emit(FetchingHomeScreenDoneState());
    animateAdsSlider();
  }

  @override
  onClose() {
    adsSliderTimer?.cancel();
  }
}
