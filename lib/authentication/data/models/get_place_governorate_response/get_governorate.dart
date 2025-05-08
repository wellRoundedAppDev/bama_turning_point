class GovernorateResponse {
  final bool isSuccssed;
  final String message;
  final List<GovernorateAD> obj;

  GovernorateResponse({
    required this.isSuccssed,
    required this.message,
    required this.obj,
  });

  factory GovernorateResponse.fromJson(Map<String, dynamic> json) {
    return GovernorateResponse(
      isSuccssed: json['IsSuccssed'] as bool,
      message: json['Message'] as String,
      obj: (json['Obj'] as List<dynamic>)
          .map((item) => GovernorateAD.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GovernorateAD {
  final String? governorateName;
  final String? notes;
  final int? countryId;
  final String? countryName;
  final int? id;
  // final DateTime? dateCreated;
  final String? idGuid;
  final String? createdById;
  final String? createdByName;
  final bool? isDeleted;
  // final DateTime? dateDeleted;
  final String? deletedById;
  final String? deletedByName;
  // final DateTime? dateUpdated;
  final String? updatedById;
  final String? updatedByName;
  final int? updatedCount;
  final int? managerStructuralValue;
  final String? managerStructuralText;

  GovernorateAD({
    required this.governorateName,
    this.notes,
    required this.countryId,
    required this.countryName,
    required this.id,
    // required this.dateCreated,
    required this.idGuid,
    required this.createdById,
    required this.createdByName,
    required this.isDeleted,
    // required this.dateDeleted,
    this.deletedById,
    this.deletedByName,
    // required this.dateUpdated,
    this.updatedById,
    this.updatedByName,
    required this.updatedCount,
    required this.managerStructuralValue,
    this.managerStructuralText,
  });

  factory GovernorateAD.fromJson(Map<String, dynamic> json) {
    return GovernorateAD(
      governorateName: json['GovernorateName'] as String?,
      notes: json['Notes'] as String?,
      countryId: json['CountryId'] as int?,
      countryName: json['CountryName'] as String?,
      id: json['Id'] as int?,
      // dateCreated: DateTime.parse(json['DateCreated'] as String),
      idGuid: json['IdGuid'] as String?,
      createdById: json['CreatedById'] as String?,
      createdByName: json['CreatedByName'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      // dateDeleted: DateTime.parse(json['DateDeleted'] as String),
      deletedById: json['DeletedById'] as String?,
      deletedByName: json['DeletedByName'] as String?,
      // dateUpdated: DateTime.parse(json['DateUpdated'] as String),
      updatedById: json['UpdatedById'] as String?,
      updatedByName: json['UpdatedByName'] as String?,
      updatedCount: json['UpdatedCount'] as int?,
      managerStructuralValue: json['ManagerStructuralValue'] as int?,
      managerStructuralText: json['ManagerStructuralText'] as String?,
    );
  }
}
