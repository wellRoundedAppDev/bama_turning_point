class GetManufactureCompanyResponse {
  final bool isSuccssed;
  final String message;
  final List<BrandAD> obj;

  GetManufactureCompanyResponse({
    required this.isSuccssed,
    required this.message,
    required this.obj,
  });

  factory GetManufactureCompanyResponse.fromJson(Map<String, dynamic> json) {
    return GetManufactureCompanyResponse(
      isSuccssed: json['IsSuccssed'] ?? false,
      message: json['Message'] ?? '',
      obj: (json['Obj'] as List<dynamic>?)
          ?.map((e) => BrandAD.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IsSuccssed': isSuccssed,
      'Message': message,
      'Obj': obj.map((e) => e.toJson()).toList(),
    };
  }
}

class BrandAD {
  final int id;
  final String name;

  BrandAD({
    required this.id,
    required this.name,
  });

  factory BrandAD.fromJson(Map<String, dynamic> json) {
    return BrandAD(
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
    };
  }
}
