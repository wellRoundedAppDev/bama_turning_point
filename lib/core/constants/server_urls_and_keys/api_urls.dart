class ApiUrls {

  static const BASE_URL =
      "https://opencart3-simple.api.opencart-api.com/";
  static const GET_SESSION_ID_ENDPOINT = "api/rest/session";
  static const GET_CATEGORIES_ENDPOINT = "api/rest/categories/extended/";
  static const GET_BANNERS_ENDPOINT = "api/rest/banners";
  static const GET_FEATURED_PRODUCTS_ENDPOINT = "api/rest/featured";
  static const GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT = "api/rest/featured/limit/";
  static const GET_NEW_ARRIVALS_ENDPOINT = "api/rest/latest";
  static const GET_NEW_ARRIVALS_LIMIT_ENDPOINT = "api/rest/latest/limit/";
  static const GET_BEST_SELLLERS_LIMIT_ENDPOINT = "api/rest/bestsellers/limit/";
  static const GET_SLIDE_SHOWS_ENDPOINT = "api/rest/slideshows";
  static const GET_PRODUCT_DETAILS_ENDPOINT = "api/rest/products/";
  static const GET_PRODUCTS_BY_CATEGORY_ID_ENDPOINT = "api/rest/products/category/";
  static const GUEST_SHIPPING_ENDPOINT = "api/rest/guestshipping";
  static const GET_LIST_OF_COUNTRIES = "api/rest/countries";
  static const GET_LIST_OF_REGIONS_BY_COUNTRY_ID = "api/rest/countries/";
  static const ADD_ITEMS_TO_CART_ENDPOINT = "api/rest/cart_bulk";
  static const CREATE_GUEST_USER = 'api/rest/guest';


  static String getFeaturedProductsWithLimitEndpoint(int limit) =>
      "$GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT$limit";
  static String getCategoriesEndpoint(int page) =>
      "$GET_CATEGORIES_ENDPOINT/limit/10/page/$page";
  static String getNewArrivalsProductsWithLimitEndpoint(int limit) =>
      "$GET_NEW_ARRIVALS_LIMIT_ENDPOINT$limit";
  static String getBestSellersWithLimitEndpoint(int limit) =>
      "$GET_BEST_SELLLERS_LIMIT_ENDPOINT$limit";
  static String getProductDetailsByIdEndpoint(int id) =>
      "$GET_PRODUCT_DETAILS_ENDPOINT$id";
  static String getProductsByCategoryIdEndpoint(int id) =>
      "$GET_PRODUCTS_BY_CATEGORY_ID_ENDPOINT$id";
  static String getListOfRegionsByCountryIdEndpoint(int id) =>
      "$GET_LIST_OF_REGIONS_BY_COUNTRY_ID$id";

}
