class GetColorResponse {
  bool? isSuccssed;
  String? message;
  List<ColorAD>? obj;

  GetColorResponse({this.isSuccssed, this.message, this.obj});

  GetColorResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['IsSuccssed'];
    message = json['Message'];
    if (json['Obj'] != null) {
      obj = <ColorAD>[];
      for (var v in json['Obj']) {
        obj!.add(ColorAD.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['IsSuccssed'] = isSuccssed;
    data['Message'] = message;
    if (obj != null) {
      data['Obj'] = obj!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorAD {
  int? id;
  String? colorName;
  String? colorValue;
  String? idGuid;
  int? colorExtraPrice;

  ColorAD({
    this.id,
    this.colorName,
    this.colorValue,
    this.idGuid,
    this.colorExtraPrice,
  });

  ColorAD.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    colorName = json['ColorName'];
    colorValue = json['ColorValue'];
    idGuid = json['idGuid'];
    colorExtraPrice = json['colorExtraPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Id'] = id;
    data['ColorName'] = colorName;
    data['ColorValue'] = colorValue;
    data['idGuid'] = idGuid;
    data['colorExtraPrice'] = colorExtraPrice;
    return data;
  }
}
