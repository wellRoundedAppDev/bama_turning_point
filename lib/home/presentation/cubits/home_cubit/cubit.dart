import 'package:classic_eccomerce/categories/data/data_sources/remote_data_sources/categories_apis.dart';
import 'package:classic_eccomerce/categories/data/models/GetCategoriesResponse.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/get_banners_api.dart';
import 'package:classic_eccomerce/home/data/data_sources/remote_data_sources/products_apis.dart';
import 'package:classic_eccomerce/home/data/models/get_banners_response.dart';
import 'package:classic_eccomerce/home/data/models/get_best_sellers_response.dart';
import 'package:classic_eccomerce/home/data/models/get_featured_products_response.dart';
import 'package:classic_eccomerce/home/data/models/get_latest_products_response.dart';
import 'package:classic_eccomerce/home/presentation/cubits/home_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<BannerAd>? banners;
  List<Category>? categories;
  List<FeaturedProduct>? featuredProducts;
  List<LatestProduct>? newArrivalsProducts;
  List<BestSeller>? bestSellersProducts;

  setBanners() async {
    var response = await GetBannersApi.getBanners();
    if (response?.success == 1) {
      banners = response?.banners;
    } else if (response?.success == 0) {
      banners = null;
    } else {
      banners = null;
    }
  }

  setFeaturedProducts() async {
    var response = await ProductsApis.getFeaturedProductsOverview();
    if (response?.success == 1) {
      featuredProducts = response?.data?[0].products;
    } else if (response?.success == 0) {
      featuredProducts = null;
    } else {
      featuredProducts = null;
    }
  }

  setNewArrivals() async {
    var response = await ProductsApis.getNewArrivalsProductsOverview();
    if (response?.success == 1) {
      newArrivalsProducts = response?.latestProducts;
    } else if (response?.success == 0) {
      newArrivalsProducts = null;
    } else {
      newArrivalsProducts = null;
    }
  }

  setBestSellers() async {
    var response = await ProductsApis.getBestSellersOverview();
    if (response?.success == 1) {
      bestSellersProducts = response?.bestSellers;
    } else if (response?.success == 0) {
      bestSellersProducts = null;
    } else {
      bestSellersProducts = null;
    }
  }

  setCategories() async {
    var response = await CategoriesApis.getCategories(1);
    if (response?.success == 1) {
      categories = response?.categories;
    } else if (response?.success == 0) {
      categories = null;
    } else {
      categories = null;
    }
  }

  init() async {
    emit(FetchingHomeScreenLoadingState());
    await setBanners();
    await setCategories();
    await setFeaturedProducts();
    await setNewArrivals();
    await setBestSellers();
    emit(FetchingHomeScreenDoneState());
  }
}
