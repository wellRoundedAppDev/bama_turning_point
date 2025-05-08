class GetGroupsResponse {
  bool? isSuccssed;
  String? message;
  List<GroupsAD>? obj;

  GetGroupsResponse({this.isSuccssed, this.message, this.obj});

  GetGroupsResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['IsSuccssed'];
    message = json['Message'];
    if (json['Obj'] != null) {
      obj = List<GroupsAD>.from(json['Obj'].map((v) => GroupsAD.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['IsSuccssed'] = isSuccssed;
    data['Message'] = message;
    if (obj != null) {
      data['Obj'] = obj!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupsAD {
  int? id;
  String? groupName;

  GroupsAD({this.id, this.groupName});

  GroupsAD.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    groupName = json['GroupName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'GroupName': groupName,
    };
  }
}
