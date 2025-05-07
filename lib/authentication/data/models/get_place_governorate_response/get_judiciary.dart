class JudiciaryResponse {
  final bool? isSuccssed;
  final String? message;
  final List<JudiciaryAD>? obj;

  JudiciaryResponse({
    this.isSuccssed,
    this.message,
    this.obj,
  });

  factory JudiciaryResponse.fromJson(Map<String, dynamic> json) {
    return JudiciaryResponse(
      isSuccssed: json['IsSuccssed'] as bool?,
      message: json['Message'] as String?,
      obj: (json['Obj'] as List<dynamic>?)
          ?.map((e) => JudiciaryAD.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'IsSuccssed': isSuccssed,
    'Message': message,
    'Obj': obj?.map((e) => e.toJson()).toList(),
  };
}

class JudiciaryAD {
  final String? judiciaryName;
  final String? governorateName;
  final String? governorateNameId;
  final String? notes;
  final int? id;
  final String? dateCreated;
  final String? idGuid;
  final String? createdById;
  final String? createdByName;
  final bool? isDeleted;
  final String? dateDeleted;
  final String? deletedById;
  final String? deletedByName;
  final String? dateUpdated;
  final String? updatedById;
  final String? updatedByName;
  final int? updatedCount;
  final int? managerStructuralValue;
  final String? managerStructuralText;

  JudiciaryAD({
    this.judiciaryName,
    this.governorateName,
    this.governorateNameId,
    this.notes,
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
    this.managerStructuralValue,
    this.managerStructuralText,
  });

  factory JudiciaryAD.fromJson(Map<String, dynamic> json) {
    return JudiciaryAD(
      judiciaryName: json['JudiciaryName'] as String?,
      governorateName: json['GovernorateName'] as String?,
      governorateNameId: json['GovernorateNameId'] as String?,
      notes: json['Notes'] as String?,
      id: json['Id'] as int?,
      dateCreated: json['DateCreated'] as String?,
      idGuid: json['IdGuid'] as String?,
      createdById: json['CreatedById'] as String?,
      createdByName: json['CreatedByName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      dateDeleted: json['DateDeleted'] as String?,
      deletedById: json['DeletedById'] as String?,
      deletedByName: json['DeletedByName'] as String?,
      dateUpdated: json['DateUpdated'] as String?,
      updatedById: json['UpdatedById'] as String?,
      updatedByName: json['UpdatedByName'] as String?,
      updatedCount: json['UpdatedCount'] as int?,
      managerStructuralValue: json['ManagerStructuralValue'] as int?,
      managerStructuralText: json['ManagerStructuralText'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'JudiciaryName': judiciaryName,
    'GovernorateName': governorateName,
    'GovernorateNameId': governorateNameId,
    'Notes': notes,
    'Id': id,
    'DateCreated': dateCreated,
    'IdGuid': idGuid,
    'CreatedById': createdById,
    'CreatedByName': createdByName,
    'IsDeleted': isDeleted,
    'DateDeleted': dateDeleted,
    'DeletedById': deletedById,
    'DeletedByName': deletedByName,
    'DateUpdated': dateUpdated,
    'UpdatedById': updatedById,
    'UpdatedByName': updatedByName,
    'UpdatedCount': updatedCount,
    'ManagerStructuralValue': managerStructuralValue,
    'ManagerStructuralText': managerStructuralText,
  };
}
