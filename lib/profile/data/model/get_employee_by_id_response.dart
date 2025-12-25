class GetEmployeeResponse {
  final bool isSuccssed;
  final String message;
  final Employee? obj;

  GetEmployeeResponse({
    required this.isSuccssed,
    required this.message,
    this.obj,
  });

  factory GetEmployeeResponse.fromJson(Map<String, dynamic> json) {
    return GetEmployeeResponse(
      isSuccssed: json['IsSuccssed'] as bool,
      message: json['Message'] as String,
      obj: json['Obj'] == null
          ? null
          : Employee.fromJson(json['Obj'] as Map<String, dynamic>),
    );
  }
}


class Employee {
  final int id;
  final String? fullName;
  final String? username;
  final String? email;
  final double? nominalSalary;

  final String? ibanForSalary;
  final int? bankForSalary;
  final String? bankForSalaryText;

  final bool? isBelongingToHR;
  final bool? isDisability;

  final DateTime? hireDate;
  final DateTime? dateOfBirthEmployee;


  final String? unifiedIdentificationNumber;
  final DateTime? dateOfIssuedUnifiedIdentificationNumber;
  final DateTime? dateOfValidityUnifiedIdentificationNumber;
  final String? placeOfOrganizationUnifiedIdentificationNumber;

  final String? residenceCardNumber;
  final DateTime? releaseDateOfResidenceCardNumber;
  final String? issuerResidenceCardNumber;

  final String? healthInsuranceNumber;
  final String? passportNumber;
  final DateTime? releaseDateOfPassportNumber;
  final String? issuerPassportNumber;
  final DateTime? effectiveOfPassportNumber;

  final String? copyOfPassport;
  final String? copyOfHousingCard;
  final String? copyOfId;

  final String? typeOfNeedDisability;
  final String? causesOfDisability;
  final DateTime? dateOfDisability;

  final bool? approvalOfVacations;

  final String? academicQualification;
  final String? academicName;
  final String? graduationYear;
  final String? graduationAverage;

  final int? qualificationValue;
  final String? qualificationText;

  final int? scientificTitleValue;
  final String? scientificTitleText;
  final DateTime? dateTitleObtained;
  final String? donorTitle;

  final String? cvFile;

  final List<dynamic>? wives;
  final List<dynamic>? children;
  final List<dynamic>? martyr;
  final List<dynamic>? emergency;

  final bool? isApproval;
  final DateTime? employeeDirectConfirmationDate;

  final bool? approvalOfDeficienciesForPurchaseOrders;
  final bool? approvalOfPurchaseOrderForPurchaseRequests;
  final bool? approvingOfPurchaseOrderIntoPurchaseInvoice;
  final bool? approvingCarOrders;

  final bool? upgradeAnEmployee;
  final DateTime? upgradeDateAnEmployee;

  final bool? seeOnlyHisReceiptsVoucher;
  final bool? seeOnlyHisBillsVoucher;
  final bool? seeOnlyHisSaleInvoice;
  final bool? seeOnlyHisPurchaseInvoice;

  final bool? hideProjectsReceiptAndPaymentVouchers;
  final bool? hideProjectsActualCost;

  final String? MotherNameEmployee;

  final String? NationalId;

  Employee({
    required this.id,
    this.fullName,
    this.username,
    this.email,
    this.nominalSalary,
    this.ibanForSalary,
    this.NationalId,
    this.bankForSalary,
    this.bankForSalaryText,
    this.isBelongingToHR,
    this.isDisability,
    this.hireDate,
    this.dateOfBirthEmployee,


    this.unifiedIdentificationNumber,
    this.dateOfIssuedUnifiedIdentificationNumber,
    this.dateOfValidityUnifiedIdentificationNumber,
    this.placeOfOrganizationUnifiedIdentificationNumber,
    this.residenceCardNumber,
    this.releaseDateOfResidenceCardNumber,
    this.issuerResidenceCardNumber,
    this.healthInsuranceNumber,
    this.passportNumber,
    this.releaseDateOfPassportNumber,
    this.issuerPassportNumber,
    this.effectiveOfPassportNumber,
    this.copyOfPassport,
    this.copyOfHousingCard,
    this.copyOfId,
    this.typeOfNeedDisability,
    this.causesOfDisability,
    this.dateOfDisability,
    this.approvalOfVacations,
    this.academicQualification,
    this.academicName,
    this.graduationYear,
    this.graduationAverage,
    this.qualificationValue,
    this.qualificationText,
    this.scientificTitleValue,
    this.scientificTitleText,
    this.dateTitleObtained,
    this.donorTitle,
    this.cvFile,
    this.wives,
    this.children,
    this.martyr,
    this.emergency,
    this.isApproval,
    this.employeeDirectConfirmationDate,
    this.approvalOfDeficienciesForPurchaseOrders,
    this.approvalOfPurchaseOrderForPurchaseRequests,
    this.approvingOfPurchaseOrderIntoPurchaseInvoice,
    this.approvingCarOrders,
    this.upgradeAnEmployee,
    this.upgradeDateAnEmployee,
    this.seeOnlyHisReceiptsVoucher,
    this.seeOnlyHisBillsVoucher,
    this.seeOnlyHisSaleInvoice,
    this.seeOnlyHisPurchaseInvoice,
    this.hideProjectsReceiptAndPaymentVouchers,
    this.hideProjectsActualCost,
    this.MotherNameEmployee
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['Id'] as int,
      fullName: json['FullName'] as String?,
      username: json['Username'] as String?,
      email: json['Email'] as String?,
      nominalSalary: (json['NominalSalary'] as num?)?.toDouble(),

      ibanForSalary: json['IBANForSalary'] as String?,
      bankForSalary: json['BankForSalary'] as int?,
      bankForSalaryText: json['BankForSalaryText'] as String?,

      MotherNameEmployee: json['MotherNameEmployee'] as String?,
      isBelongingToHR: json['IsBelongingToHR'] as bool?,
      isDisability: json['IsDisability'] as bool?,

      hireDate: _parseDate(json['HireDate']),
      dateOfBirthEmployee: _parseDate(json['DateOfBirthEmployee']),


      NationalId: json['NationalId'],



      unifiedIdentificationNumber: json['UnifiedIdentificationNumber'],
      dateOfIssuedUnifiedIdentificationNumber:
      _parseDate(json['DateOfIssuedUnifiedIdentificationNumber']),
      dateOfValidityUnifiedIdentificationNumber:
      _parseDate(json['DateOfValidityUnifiedIdentificationNumber']),
      placeOfOrganizationUnifiedIdentificationNumber:
      json['PlaceOfOrganizationUnifiedIdentificationNumber'],
      residenceCardNumber: json['ResidenceCardNumber'],
      releaseDateOfResidenceCardNumber:
      _parseDate(json['ReleaseDateOfResidenceCardNumber']),
      issuerResidenceCardNumber: json['IssuerResidenceCardNumber'],
      healthInsuranceNumber: json['HealthInsuranceNumber'],
      passportNumber: json['PassportNumber'],
      releaseDateOfPassportNumber:
      _parseDate(json['ReleaseDateOfPassportNumber']),
      issuerPassportNumber: json['IssuerPassportNumber'],
      effectiveOfPassportNumber:
      _parseDate(json['EffectiveOfPassportNumber']),
      copyOfPassport: json['CopyOfPassport'],
      copyOfHousingCard: json['CopyOfHousingCard'],
      copyOfId: json['CopyOfId'],
      typeOfNeedDisability: json['TypeOfNeedDisability'],
      causesOfDisability: json['CausesOfDisability'],
      dateOfDisability: _parseDate(json['DateOfDisability']),
      approvalOfVacations: json['ApprovalOfvacations'],
      academicQualification: json['AcademicQualification'],
      academicName: json['AcademicName'],
      graduationYear: json['GraduationYear'],
      graduationAverage: json['GraduationAverage'],
      qualificationValue: json['QualificationValue'],
      qualificationText: json['QualificationText'],
      scientificTitleValue: json['ScientificTitleValue'],
      scientificTitleText: json['ScientificTitleText'],
      dateTitleObtained: _parseDate(json['DateTitleObtained']),
      donorTitle: json['DonorTitle'],
      cvFile: json['CVFile'],
      wives: json['Wives'],
      children: json['Children'],
      martyr: json['Martyr'],
      emergency: json['Emergency'],
      isApproval: json['IsApproval'],
      employeeDirectConfirmationDate:
      _parseDate(json['EmployeeDirectConfirmationDate']),
      approvalOfDeficienciesForPurchaseOrders:
      json['ApprovalOfDeficienciesForPurchaseOrders'],
      approvalOfPurchaseOrderForPurchaseRequests:
      json['ApprovalOfPurchaseOrderForPurchaseRequests'],
      approvingOfPurchaseOrderIntoPurchaseInvoice:
      json['ApprovingOfPurchaseOrderIntoPurchaseInvoice'],
      approvingCarOrders: json['ApprovingCarOrders'],
      upgradeAnEmployee: json['UpgradeAnEmployee'],
      upgradeDateAnEmployee: _parseDate(json['UpgradeDateAnEmployee']),
      seeOnlyHisReceiptsVoucher: json['SeeOnlyHisReceiptsVoucher'],
      seeOnlyHisBillsVoucher: json['SeeOnlyHisBillsVoucher'],
      seeOnlyHisSaleInvoice: json['SeeOnlyHisSaleInvoice'],
      seeOnlyHisPurchaseInvoice: json['SeeOnlyHisPurchaseInvoice'],
      hideProjectsReceiptAndPaymentVouchers:
      json['HideProjectsReceiptAndPaymentVouchers'],
      hideProjectsActualCost: json['HideProjectsActualCost'],

    );
  }




  static DateTime? _parseDate(dynamic value) {
    if (value == null || value == "0001-01-01T00:00:00") return null;
    return DateTime.tryParse(value);
  }
}
