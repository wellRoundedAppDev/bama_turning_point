class SuccessAndErrorResponse {
  bool? success;
  List<String>? errorMsgs;

  SuccessAndErrorResponse({required this.success, required this.errorMsgs});

  factory SuccessAndErrorResponse.fromJson(Map<String, dynamic> json) =>
      SuccessAndErrorResponse(
          success: json['success'] == 1
              ? true
              : json['success'] == 0
                  ? false
                  : null,
          errorMsgs: json['message']);
}
