import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/home/data/models/get_slide_shows_response.dart';
import 'package:flutter/foundation.dart';

class GetSlideShowsApi {
  static final dioHelper = DioHelper.instance;

  static Future<GetSlideShowsResponse?> getSlideShows() async {
    String endPoint = ApiUrls.GET_SLIDE_SHOWS_ENDPOINT;
    try {
      var response = await dioHelper.get(endpoint: endPoint);
      if (response == null) {
        return null;
      }
      return GetSlideShowsResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}