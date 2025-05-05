import 'get_response_model/get_color_response.dart';

class FilterFormInput {
  int? groupId;
  int? categoryId;
  int? supplierId;
  double? sellingPriceMinimum;
  double? sellingPriceMinimumMaximum;
  String? size;
  ColorAD? colors;
  int? manufactureCompanyId;

  Map<String, dynamic> toJson() => {
         'id': 0,
        "groupId": groupId??0,
        "categoryId": categoryId??0,
        "supplierId": supplierId??0,
        "sellingPriceMinimum": sellingPriceMinimum??0,
        "sellingPriceMinimumMaximum": sellingPriceMinimumMaximum??15000,
        "size": size??"",
        "colors": colors != null
            ? [
          {
            "id": colors!.id ?? 0,
            "idGuid": colors!.idGuid ?? "00000000-0000-0000-0000-000000000000",
            "colorExtraPrice": 0,
            "colorName": colors!.colorName ?? "",
          }
        ]
            : [],
        "manufactureCompanyId": 0
      };
}

// "id": 0,
// "groupId": 5,........API
// "categoryId": 1,.....API
// "supplierId": 0,.....API
// "sellingPriceMinimum": 100,....VALUE
// "sellingPriceMinimumMaximum": 500,....VALUE
// "size": "string",....VALUE
// "colors": [
// {
// "id": 3,.......API
// "idGuid": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
// "colorExtraPrice": 0,
// "colorName": "string"
// }
// ],
// "manufactureCompanyId": 7.....API
// }
