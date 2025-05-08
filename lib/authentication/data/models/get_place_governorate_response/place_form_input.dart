class PlaceFormInput {
  int? governorateId;
  int? judiciaryId;
  int? wayId;

  Map<String, dynamic> toJson() => {
    'id': 0,
    "governorateId": governorateId??0,
    "judiciaryId": judiciaryId??0,
    "wayId": wayId??0,
  };
}
