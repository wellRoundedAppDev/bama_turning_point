class SuccessAndErrorResponse {
  bool? success;
  dynamic errorMsgs;
  String? message;

  SuccessAndErrorResponse(
      {required this.success, required this.errorMsgs, this.message});
 // SuccessAndErrorResponse({required this.success, required this.errorMsgs,this.message});

  factory SuccessAndErrorResponse.fromJson(Map<String, dynamic> json) =>
      // SuccessAndErrorResponse(
      //     success: json['success'] == 1
      //         ? true
      //         : json['success'] == 0
      //             ? false
      //             : null,
      //     errorMsgs: json['error']);
      SuccessAndErrorResponse(
          message: json['Message'],
          success: json['IsSuccssed'],
          errorMsgs: json['Message']);
  //SuccessAndErrorResponse(
   //
   // message:  json['Message'],
   //    success: json['IsSuccssed'],
   //    errorMsgs: json['Message']);
}
