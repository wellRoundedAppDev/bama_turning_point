import 'get_response_model/get_color_response.dart';

class FilterFormInput{
  int? groupId;
  int? vendorId;
  int? supplierId;
  double? sellingPriceMinimum;
  double? sellingPriceMinimumMaximum;
  int? size;
  ColorAD? colors;

  Map<String, dynamic> toJson() => {
    'id': 0,
    "vendorId": vendorId??0,
    "productName": "",
    "groupId": groupId??0,
    "supplierId": supplierId??0,
    "sellingPriceMinimum": sellingPriceMinimum??0,
    "sellingPriceMinimumMaximum": sellingPriceMinimumMaximum??100000,
    "sizeId": size??0,
    "colors": colors != null
        ? [
      {
        "colorId": colors!.id ,
      }
    ]
        : [{
      "colorId": 0 ,
    }],
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
