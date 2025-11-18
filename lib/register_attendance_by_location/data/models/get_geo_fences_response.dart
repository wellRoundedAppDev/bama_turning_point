class GeoFencesResponse {
  final bool? isSuccssed;
  final String? message;
  final List<GeoFenceItem>? geofences;

  GeoFencesResponse({
    this.isSuccssed,
    this.message,
    this.geofences,
  });

  factory GeoFencesResponse.fromJson(Map<String, dynamic> json) {
    return GeoFencesResponse(
      isSuccssed: json['IsSuccssed'] as bool?,
      message: json['Message'] as String?,
      geofences: (json['Obj'] as List<dynamic>?)
          ?.map((e) => GeoFenceItem.fromJson(e))
          .toList(),
    );
  }
}

class GeoFenceItem {
  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final double? radiusMeters;

  GeoFenceItem({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.radiusMeters,
  });

  factory GeoFenceItem.fromJson(Map<String, dynamic> json) {
    return GeoFenceItem(
      id: json['Id'] as int?,
      name: json['Name'] as String?,
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
      radiusMeters: (json['RadiusMeters'] as num?)?.toDouble(),
    );
  }
}
