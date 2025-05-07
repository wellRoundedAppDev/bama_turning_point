class WayResponse {
  final bool isSuccssed;
  final String message;
  final List<WayAD> obj;

  WayResponse({
    required this.isSuccssed,
    required this.message,
    required this.obj,
  });

  factory WayResponse.fromJson(Map<String, dynamic> json) {
    return WayResponse(
      isSuccssed: json['IsSuccssed'] as bool,
      message: json['Message'] as String,
      obj: (json['Obj'] as List<dynamic>)
          .map((item) => WayAD.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class WayAD {
  final String? wayName;
  final String? judiciaryName;
  final int? judiciaryNameId;
  final String? governorateName;
  final int? governorateNameId;
  final String? notes;
  final int? id;
  final String? idGuid;
  final String? createdById;
  final String? createdByName;
  final bool? isDeleted;
  final String? deletedById;
  final String? deletedByName;
  final String? updatedById;
  final String? updatedByName;
  final int? updatedCount;
  final int? managerStructuralValue;
  final String? managerStructuralText;

  WayAD({
    required this.wayName,
    required this.judiciaryName,
    required this.judiciaryNameId,
    required this.governorateName,
    required this.governorateNameId,
    this.notes,
    required this.id,
    required this.idGuid,
    required this.createdById,
    required this.createdByName,
    required this.isDeleted,
    this.deletedById,
    this.deletedByName,
    this.updatedById,
    this.updatedByName,
    required this.updatedCount,
    required this.managerStructuralValue,
    this.managerStructuralText,
  });

  factory WayAD.fromJson(Map<String, dynamic> json) {
    return WayAD(
      wayName: json['WayName'] as String?,
      judiciaryName: json['JudiciaryName'] as String?,
      judiciaryNameId: json['JudiciaryNameId'] as int?,
      governorateName: json['GovernorateName'] as String?,
      governorateNameId: json['GovernorateNameId'] as int?,
      notes: json['Notes'] as String?,
      id: json['Id'] as int?,
      idGuid: json['IdGuid'] as String?,
      createdById: json['CreatedById'] as String?,
      createdByName: json['CreatedByName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      deletedById: json['DeletedById'] as String?,
      deletedByName: json['DeletedByName'] as String?,
      updatedById: json['UpdatedById'] as String?,
      updatedByName: json['UpdatedByName'] as String?,
      updatedCount: json['UpdatedCount'] as int?,
      managerStructuralValue: json['ManagerStructuralValue'] as int?,
      managerStructuralText: json['ManagerStructuralText'] as String?,
    );
  }
}
