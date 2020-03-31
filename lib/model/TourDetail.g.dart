// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TourDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourDetail _$TourDetailFromJson(Map<String, dynamic> json) {
  return TourDetail(
    json['id'] as String,
    json['tourname_id_fk'] as String,
    json['imageUrl'] as String,
    json['use_gpsmap'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$TourDetailToJson(TourDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourname_id_fk': instance.tourname_id_fk,
      'imageUrl': instance.imageUrl,
      'use_gpsmap': instance.use_gpsmap,
      'description': instance.description,
    };
