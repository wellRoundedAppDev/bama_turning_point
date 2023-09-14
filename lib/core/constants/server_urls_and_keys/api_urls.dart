class ApiUrls {
  static const BASE_URL =
      "https://opencart3-simple.api.opencart-api.com/api/rest/";
  static const GET_SESSION_ID_ENDPOINT = "session";
  static const GET_CATEGORIES_ENDPOINT = "categories/extended/";
  static const GET_BANNERS_ENDPOINT = "banners";
  static const GET_FEATURED_PRODUCTS_ENDPOINT = "featured";
  static const GET_FEATURED_PRODUCTS_LIMIT_ENDPOINT = "featured/limit/";
  static const GET_NEW_ARRIVALS_ENDPOINT = "latest";
  static const GET_NEW_ARRIVALS_LIMIT_ENDPOINT = "latest/limit/";
  static const GET_BEST_SELLLERS_LIMIT_ENDPOINT = "bestsellers/limit/";
  static const GET_SLIDE_SHOWS_ENDPOINT = "slideshows";
  static const GET_PRODUCT_DETAILS_ENDPOINT = "products/";

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
}
