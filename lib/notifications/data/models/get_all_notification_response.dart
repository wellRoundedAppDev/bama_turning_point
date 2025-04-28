class GetAllNotificationResponse {
  GetAllNotificationResponse({
      this.isSuccssed, 
      this.message, 
      this.obj,});

 factory GetAllNotificationResponse.fromJson(dynamic json) {
   var isSuccssed = json['IsSuccssed'];
   var message = json['Message'];
   var obj = json['Obj'] != null ? Obj.fromJson(json['Obj']) : null;

   return GetAllNotificationResponse(isSuccssed: isSuccssed,message: message,obj: obj);
  }
  bool? isSuccssed;
  String? message;
  Obj? obj;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSuccssed'] = isSuccssed;
    map['Message'] = message;
    if (obj != null) {
      map['Obj'] = obj?.toJson();
    }
    return map;
  }

}

class Obj {
  Obj({
      this.notifications, 
      this.unreadCount,});

  factory Obj.fromJson(dynamic json) {
    List<NotificationResponseModel>? notifications;
    if (json['Notifications'] != null) {
      notifications = [];
      json['Notifications'].forEach((v) {
        notifications?.add(NotificationResponseModel.fromJson(v));
      });
    }
    var unreadCount = json['UnreadCount'];

    return Obj(notifications: notifications,unreadCount: unreadCount);
  }
  List<NotificationResponseModel>? notifications;
  num? unreadCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (notifications != null) {
      map['Notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    map['UnreadCount'] = unreadCount;
    return map;
  }

}

class NotificationResponseModel {
  NotificationResponseModel({
      this.id, 
      this.message, 
      this.title, 
      this.isRead,});

 factory NotificationResponseModel.fromJson(dynamic json) {
   var id = json['Id'];
   var message = json['Message'];
   var title = json['Title'];
   var isRead = json['IsRead'];

   return NotificationResponseModel(id: id,message: message,title: title,isRead: isRead);
  }
  num? id;
  String? message;
  String? title;
  bool? isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Message'] = message;
    map['Title'] = title;
    map['IsRead'] = isRead;
    return map;
  }

}