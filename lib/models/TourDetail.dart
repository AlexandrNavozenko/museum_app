import 'package:json_annotation/json_annotation.dart';

part 'TourDetail.g.dart';

@JsonSerializable()
class TourDetail {
  final String id;
  final String tourname_id_fk;
  final String imageUrl;
  final String use_gpsmap;
  final String description;

  TourDetail(this.id, this.tourname_id_fk, this.imageUrl, this.use_gpsmap, this.description);

  factory TourDetail.fromJson(Map<String, dynamic> json) => _$TourDetailFromJson(json);

}
