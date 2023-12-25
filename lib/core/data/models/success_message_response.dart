class SuccessAndErrorResponse {
  bool? success;
 dynamic errorMsgs;

  SuccessAndErrorResponse({required this.success, required this.errorMsgs});

  factory SuccessAndErrorResponse.fromJson(Map<String, dynamic> json) =>
      SuccessAndErrorResponse(
          success: json['success'] == 1
              ? true
              : json['success'] == 0
                  ? false
                  : null,
          errorMsgs: json['error'].cast<String>());
}
