class FaceRegisteredUser {
  String name;
  final List<double> vectorList;
  FaceRegisteredUser(this.name, this.vectorList);

  FaceRegisteredUser copyWith({List<double>? list}) {
    return FaceRegisteredUser(name, list ?? vectorList);
  }

  // Convert User to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'vectorList': vectorList,
    };
  }

  // Create User from JSON
  factory FaceRegisteredUser.fromJson(Map<String, dynamic> json) {
    return FaceRegisteredUser(
      json['name'] as String,
      List<double>.from(json['vectorList'] as List),
    );
  }
}
