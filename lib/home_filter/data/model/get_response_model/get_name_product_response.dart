class GetCategoryResponse {
  final bool isSuccssed;
  final String message;
  final List<CategoryAD> obj;

  GetCategoryResponse({
    required this.isSuccssed,
    required this.message,
    required this.obj,
  });

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) {
    return GetCategoryResponse(
      isSuccssed: json['IsSuccssed'] ?? false,
      message: json['Message'] ?? '',
      obj: (json['Obj'] as List<dynamic>?)
          ?.map((e) => CategoryAD.fromJson(e))
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

class CategoryAD {
  final int id;
  final String categoryStoreName;

  CategoryAD({
    required this.id,
    required this.categoryStoreName,
  });

  factory CategoryAD.fromJson(Map<String, dynamic> json) {
    return CategoryAD(
      id: json['Id'] ?? 0,
      categoryStoreName: json['CategoryStoreName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'CategoryStoreName': categoryStoreName,
    };
  }
}
