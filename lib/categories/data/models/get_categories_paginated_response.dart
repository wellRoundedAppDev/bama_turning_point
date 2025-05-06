//todo old
// class GetCategoriesPaginatedResponse {
//   GetCategoriesPaginatedResponse({
//     this.isSuccssed,
//     this.message,
//     this.obj,
//   });
//
//   factory GetCategoriesPaginatedResponse.fromJson(dynamic json) {
//     var isSuccssed = json['IsSuccssed'];
//     var message = json['Message'];
//     var obj = json['Obj'] != null ? Obj.fromJson(json['Obj']) : null;
//
//     return GetCategoriesPaginatedResponse(
//         isSuccssed: isSuccssed, message: message, obj: obj);
//   }
//   bool? isSuccssed;
//   String? message;
//   Obj? obj;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['IsSuccssed'] = isSuccssed;
//     map['Message'] = message;
//     if (obj != null) {
//       map['Obj'] = obj?.toJson();
//     }
//     return map;
//   }
// }
//
// class Obj {
//   Obj({
//     this.dataReturn,
//     this.totalPages,
//     this.currentPage,
//     this.pageSize,
//     this.totalItems,
//   });
//
//   factory Obj.fromJson(dynamic json) {
//     List<Category2>? dataReturn;
//     if (json['DataReturn'] != null) {
//       dataReturn = [];
//       json['DataReturn'].forEach((v) {
//         dataReturn?.add(Category2.fromJson(v));
//       });
//     }
//     var totalPages = json['TotalPages'];
//     var currentPage = json['CurrentPage'];
//     var pageSize = json['PageSize'];
//     var totalItems = json['TotalItems'];
//
//     return Obj(
//         dataReturn: dataReturn,
//         totalPages: totalPages,
//         currentPage: currentPage,
//         pageSize: pageSize,
//         totalItems: totalItems);
//   }
//   List<Category2>? dataReturn;
//   num? totalPages;
//   num? currentPage;
//   num? pageSize;
//   num? totalItems;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (dataReturn != null) {
//       map['DataReturn'] = dataReturn?.map((v) => v.toJson()).toList();
//     }
//     map['TotalPages'] = totalPages;
//     map['CurrentPage'] = currentPage;
//     map['PageSize'] = pageSize;
//     map['TotalItems'] = totalItems;
//     return map;
//   }
// }
//
// class Category2 {
//   Category2({
//     this.groupName,
//     this.accName,
//     this.accNameId,
//     this.buyAccName,
//     this.buyAccId,
//     this.startAccName,
//     this.startAccId,
//     this.extinctionCoefficientId,
//     this.extinctionPeriod,
//     this.extinctionCoefficientName,
//     this.isExtinction,
//     this.validityType,
//     this.validityPeriod,
//     this.validityTypeName,
//     this.isHasValidity,
//     this.fileUrl,
//     this.id,
//     this.dateCreated,
//     this.idGuid,
//     this.createdById,
//     this.createdByName,
//     this.isDeleted,
//     this.dateDeleted,
//     this.deletedById,
//     this.deletedByName,
//     this.dateUpdated,
//     this.updatedById,
//     this.updatedByName,
//     this.updatedCount,
//     this.notes,
//     this.managerStructuralValue,
//     this.managerStructuralText,
//   });
//
//   factory Category2.fromJson(dynamic json) {
//    var groupName = json['GroupName'];
//    var accName = json['AccName'];
//    var accNameId = json['AccNameId'];
//    var buyAccName = json['BuyAccName'];
//    var  buyAccId = json['BuyAccId'];
//    var  startAccName = json['StartAccName'];
//    var   startAccId = json['StartAccId'];
//    var   extinctionCoefficientId = json['ExtinctionCoefficientId'];
//    var   extinctionPeriod = json['ExtinctionPeriod'];
//    var   extinctionCoefficientName = json['ExtinctionCoefficientName'];
//    var    isExtinction = json['IsExtinction'];
//    var    validityType = json['ValidityType'];
//    var    validityPeriod = json['ValidityPeriod'];
//    var    validityTypeName = json['ValidityTypeName'];
//    var   isHasValidity = json['IsHasValidity'];
//    var   fileUrl = json['FileUrl'];
//    var   id = json['Id'];
//    var   dateCreated = json['DateCreated'];
//    var   idGuid = json['IdGuid'];
//    var    createdById = json['CreatedById'];
//    var   createdByName = json['CreatedByName'];
//    var    isDeleted = json['IsDeleted'];
//    var    dateDeleted = json['DateDeleted'];
//    var    deletedById = json['DeletedById'];
//    var  deletedByName = json['DeletedByName'];
//    var dateUpdated = json['DateUpdated'];
//    var   updatedById = json['UpdatedById'];
//    var updatedByName = json['UpdatedByName'];
//    var   updatedCount = json['UpdatedCount'];
//    var    notes = json['Notes'];
//    var    managerStructuralValue = json['ManagerStructuralValue'];
//    var   managerStructuralText = json['ManagerStructuralText'];
//
//    return Category2(id: id,idGuid: idGuid,isDeleted: isDeleted,isExtinction: isExtinction,isHasValidity: isHasValidity,
//    updatedById: updatedById,buyAccId: buyAccId,buyAccName: buyAccName,managerStructuralText: managerStructuralText,managerStructuralValue: managerStructuralValue,
//
//      notes: notes,validityPeriod: validityPeriod,validityType: validityType,validityTypeName: validityTypeName,
//      createdById: createdById,createdByName: createdByName,
//      accName: accName,accNameId: accNameId,startAccId: startAccId,startAccName: startAccName,
//      updatedByName: updatedByName,updatedCount: updatedCount,
//      groupName: groupName,dateCreated: dateCreated,dateDeleted: dateDeleted,dateUpdated: dateUpdated,
//      deletedById: deletedById,
//      deletedByName: deletedByName,
//      extinctionCoefficientId: extinctionCoefficientId,
//      extinctionCoefficientName: extinctionCoefficientName,
//      extinctionPeriod: extinctionPeriod,
//      fileUrl: fileUrl
//    );
//   }
//   String? groupName;
//   String? accName;
//   num? accNameId;
//   dynamic buyAccName;
//   num? buyAccId;
//   dynamic startAccName;
//   num? startAccId;
//   num? extinctionCoefficientId;
//   num? extinctionPeriod;
//   String? extinctionCoefficientName;
//   bool? isExtinction;
//   num? validityType;
//   num? validityPeriod;
//   String? validityTypeName;
//   bool? isHasValidity;
//   String? fileUrl;
//   num? id;
//   String? dateCreated;
//   String? idGuid;
//   dynamic createdById;
//   dynamic createdByName;
//   bool? isDeleted;
//   String? dateDeleted;
//   dynamic deletedById;
//   dynamic deletedByName;
//   String? dateUpdated;
//   String? updatedById;
//   String? updatedByName;
//   num? updatedCount;
//   dynamic notes;
//   num? managerStructuralValue;
//   String? managerStructuralText;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['GroupName'] = groupName;
//     map['AccName'] = accName;
//     map['AccNameId'] = accNameId;
//     map['BuyAccName'] = buyAccName;
//     map['BuyAccId'] = buyAccId;
//     map['StartAccName'] = startAccName;
//     map['StartAccId'] = startAccId;
//     map['ExtinctionCoefficientId'] = extinctionCoefficientId;
//     map['ExtinctionPeriod'] = extinctionPeriod;
//     map['ExtinctionCoefficientName'] = extinctionCoefficientName;
//     map['IsExtinction'] = isExtinction;
//     map['ValidityType'] = validityType;
//     map['ValidityPeriod'] = validityPeriod;
//     map['ValidityTypeName'] = validityTypeName;
//     map['IsHasValidity'] = isHasValidity;
//     map['FileUrl'] = fileUrl;
//     map['Id'] = id;
//     map['DateCreated'] = dateCreated;
//     map['IdGuid'] = idGuid;
//     map['CreatedById'] = createdById;
//     map['CreatedByName'] = createdByName;
//     map['IsDeleted'] = isDeleted;
//     map['DateDeleted'] = dateDeleted;
//     map['DeletedById'] = deletedById;
//     map['DeletedByName'] = deletedByName;
//     map['DateUpdated'] = dateUpdated;
//     map['UpdatedById'] = updatedById;
//     map['UpdatedByName'] = updatedByName;
//     map['UpdatedCount'] = updatedCount;
//     map['Notes'] = notes;
//     map['ManagerStructuralValue'] = managerStructuralValue;
//     map['ManagerStructuralText'] = managerStructuralText;
//     return map;
//   }
// }


class GetCategoriesPaginatedResponse {
  GetCategoriesPaginatedResponse({
    this.isSuccssed,
    this.message,
    this.obj,
  });

  factory GetCategoriesPaginatedResponse.fromJson(dynamic json) {
    var isSuccssed = json['IsSuccssed'];
    var message = json['Message'];
    var obj = json['Obj'] != null ? json['Obj']?.map<Category2>((e)=>Category2(
      id: e['Id'],
      groupName: e['GroupName'],
      fileUrl: e['FileUrl']
    ))?.toList()??[] : null;

    return GetCategoriesPaginatedResponse(
        isSuccssed: isSuccssed, message: message, obj: obj);
  }
  bool? isSuccssed;
  String? message;
  List<Category2>? obj;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['IsSuccssed'] = isSuccssed;
  //   map['Message'] = message;
  //   if (obj != null) {
  //     map['Obj'] = obj?.toJson();
  //   }
  //   return map;
  // }
}

class Category2 {
  Category2({
    this.groupName,
    this.accName,
    this.accNameId,
    this.buyAccName,
    this.buyAccId,
    this.startAccName,
    this.startAccId,
    this.extinctionCoefficientId,
    this.extinctionPeriod,
    this.extinctionCoefficientName,
    this.isExtinction,
    this.validityType,
    this.validityPeriod,
    this.validityTypeName,
    this.isHasValidity,
    this.fileUrl,
    this.id,
    this.dateCreated,
    this.idGuid,
    this.createdById,
    this.createdByName,
    this.isDeleted,
    this.dateDeleted,
    this.deletedById,
    this.deletedByName,
    this.dateUpdated,
    this.updatedById,
    this.updatedByName,
    this.updatedCount,
    this.notes,
    this.managerStructuralValue,
    this.managerStructuralText,
  });

  factory Category2.fromJson(dynamic json) {
   var groupName = json['GroupName'];
   var accName = json['AccName'];
   var accNameId = json['AccNameId'];
   var buyAccName = json['BuyAccName'];
   var  buyAccId = json['BuyAccId'];
   var  startAccName = json['StartAccName'];
   var   startAccId = json['StartAccId'];
   var   extinctionCoefficientId = json['ExtinctionCoefficientId'];
   var   extinctionPeriod = json['ExtinctionPeriod'];
   var   extinctionCoefficientName = json['ExtinctionCoefficientName'];
   var    isExtinction = json['IsExtinction'];
   var    validityType = json['ValidityType'];
   var    validityPeriod = json['ValidityPeriod'];
   var    validityTypeName = json['ValidityTypeName'];
   var   isHasValidity = json['IsHasValidity'];
   var   fileUrl = json['FileUrl'];
   var   id = json['Id'];
   var   dateCreated = json['DateCreated'];
   var   idGuid = json['IdGuid'];
   var    createdById = json['CreatedById'];
   var   createdByName = json['CreatedByName'];
   var    isDeleted = json['IsDeleted'];
   var    dateDeleted = json['DateDeleted'];
   var    deletedById = json['DeletedById'];
   var  deletedByName = json['DeletedByName'];
   var dateUpdated = json['DateUpdated'];
   var   updatedById = json['UpdatedById'];
   var updatedByName = json['UpdatedByName'];
   var   updatedCount = json['UpdatedCount'];
   var    notes = json['Notes'];
   var    managerStructuralValue = json['ManagerStructuralValue'];
   var   managerStructuralText = json['ManagerStructuralText'];

   return Category2(id: id,idGuid: idGuid,isDeleted: isDeleted,isExtinction: isExtinction,isHasValidity: isHasValidity,
   updatedById: updatedById,buyAccId: buyAccId,buyAccName: buyAccName,managerStructuralText: managerStructuralText,managerStructuralValue: managerStructuralValue,

     notes: notes,validityPeriod: validityPeriod,validityType: validityType,validityTypeName: validityTypeName,
     createdById: createdById,createdByName: createdByName,
     accName: accName,accNameId: accNameId,startAccId: startAccId,startAccName: startAccName,
     updatedByName: updatedByName,updatedCount: updatedCount,
     groupName: groupName,dateCreated: dateCreated,dateDeleted: dateDeleted,dateUpdated: dateUpdated,
     deletedById: deletedById,
     deletedByName: deletedByName,
     extinctionCoefficientId: extinctionCoefficientId,
     extinctionCoefficientName: extinctionCoefficientName,
     extinctionPeriod: extinctionPeriod,
     fileUrl: fileUrl
   );
  }
  String? groupName;
  String? accName;
  num? accNameId;
  dynamic buyAccName;
  num? buyAccId;
  dynamic startAccName;
  num? startAccId;
  num? extinctionCoefficientId;
  num? extinctionPeriod;
  String? extinctionCoefficientName;
  bool? isExtinction;
  num? validityType;
  num? validityPeriod;
  String? validityTypeName;
  bool? isHasValidity;
  String? fileUrl;
  num? id;
  String? dateCreated;
  String? idGuid;
  dynamic createdById;
  dynamic createdByName;
  bool? isDeleted;
  String? dateDeleted;
  dynamic deletedById;
  dynamic deletedByName;
  String? dateUpdated;
  String? updatedById;
  String? updatedByName;
  num? updatedCount;
  dynamic notes;
  num? managerStructuralValue;
  String? managerStructuralText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['GroupName'] = groupName;
    map['AccName'] = accName;
    map['AccNameId'] = accNameId;
    map['BuyAccName'] = buyAccName;
    map['BuyAccId'] = buyAccId;
    map['StartAccName'] = startAccName;
    map['StartAccId'] = startAccId;
    map['ExtinctionCoefficientId'] = extinctionCoefficientId;
    map['ExtinctionPeriod'] = extinctionPeriod;
    map['ExtinctionCoefficientName'] = extinctionCoefficientName;
    map['IsExtinction'] = isExtinction;
    map['ValidityType'] = validityType;
    map['ValidityPeriod'] = validityPeriod;
    map['ValidityTypeName'] = validityTypeName;
    map['IsHasValidity'] = isHasValidity;
    map['FileUrl'] = fileUrl;
    map['Id'] = id;
    map['DateCreated'] = dateCreated;
    map['IdGuid'] = idGuid;
    map['CreatedById'] = createdById;
    map['CreatedByName'] = createdByName;
    map['IsDeleted'] = isDeleted;
    map['DateDeleted'] = dateDeleted;
    map['DeletedById'] = deletedById;
    map['DeletedByName'] = deletedByName;
    map['DateUpdated'] = dateUpdated;
    map['UpdatedById'] = updatedById;
    map['UpdatedByName'] = updatedByName;
    map['UpdatedCount'] = updatedCount;
    map['Notes'] = notes;
    map['ManagerStructuralValue'] = managerStructuralValue;
    map['ManagerStructuralText'] = managerStructuralText;
    return map;
  }
}
