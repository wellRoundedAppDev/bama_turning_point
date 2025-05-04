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
      json['Obj'].forEach((v) {
        obj!.add(new ColorAD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccssed'] = this.isSuccssed;
    data['Message'] = this.message;
    if (this.obj != null) {
      data['Obj'] = this.obj!.map((v) => v.toJson()).toList();
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


  ColorAD({this.id, this.colorName, this.colorValue,this.idGuid,this.colorExtraPrice});

  ColorAD.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    colorName = json['ColorName'];
    colorValue = json['ColorValue'];
    idGuid=json['idGuid'];
    colorExtraPrice==json['colorExtraPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ColorName'] = this.colorName;
    data['ColorValue'] = this.colorValue;
    data['idGuid']=this.idGuid;
    data['colorExtraPrice']=this.colorExtraPrice;
    return data;
  }
}