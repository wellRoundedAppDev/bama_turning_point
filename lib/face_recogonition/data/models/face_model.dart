class FaceRegisteredUser {
  int id;
  String name;
  final List<double> vectorList;
  FaceRegisteredUser(this.name, this.vectorList,this.id);

  FaceRegisteredUser copyWith({List<double>? list}) {
    return FaceRegisteredUser(name, list ?? vectorList,id);
  }

  // Convert User to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'vectorList': vectorList,
      "id":id
    };
  }

  // Create User from JSON
  factory FaceRegisteredUser.fromJson(Map<String, dynamic> json) {
    return FaceRegisteredUser(
      json['name'] as String,
      List<double>.from(json['vectorList'] as List),
json['id']  as int  );
  }
}
