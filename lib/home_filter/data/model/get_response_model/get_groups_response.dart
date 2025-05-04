class GetGroupsResponse {
  bool? isSuccssed;
  String? message;
  List<GroupsAD>? obj;

  GetGroupsResponse({this.isSuccssed, this.message, this.obj});

  GetGroupsResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['IsSuccssed'];
    message = json['Message'];
    if (json['Obj'] != null) {
      obj = <GroupsAD>[];
      json['Obj'].forEach((v) {
        obj!.add(new GroupsAD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccssed'] = this.isSuccssed;
    data['Message'] = this.message;
    if (this.obj != null) {
      data['Obj'] = this.obj!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['GroupName'] = this.groupName;
    return data;
  }
}