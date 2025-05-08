class GetSizeResponse {
  final bool isSuccess;
  final String message;
  final List<SizeAD> obj;

  GetSizeResponse({
    required this.isSuccess,
    required this.message,
    required this.obj,
  });

  factory GetSizeResponse.fromJson(Map<String, dynamic> json) {
    return GetSizeResponse(
      isSuccess: json['IsSuccssed'],
      message: json['Message'],
      obj: (json['Obj'] as List).map((e) => SizeAD.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IsSuccssed': isSuccess,
      'Message': message,
      'Obj': obj.map((e) => e.toJson()).toList(),
    };
  }
}

class SizeAD {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  SizeAD({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory SizeAD.fromJson(Map<String, dynamic> json) {
    return SizeAD(
      id: json['Id'],
      nameAr: json['NameAr'],
      nameEn: json['NameEn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'NameAr': nameAr,
      'NameEn': nameEn,
    };
  }
}