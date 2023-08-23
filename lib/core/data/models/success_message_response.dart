class SuccessAndMessageResponse {
  bool? success;
  String? message;

  SuccessAndMessageResponse({required this.success, required this.message});

  factory SuccessAndMessageResponse.fromJson(Map<String, dynamic> json) =>
      SuccessAndMessageResponse(
          success: json['success'], message: json['message']);
}
