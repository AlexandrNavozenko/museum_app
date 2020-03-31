// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tour _$TourFromJson(Map<String, dynamic> json) {
  return Tour(
    json['id'] as String,
    json['name'] as String,
    json['time'] as String,
    json['points'] as String,
    json['city'] as String,
    json['state'] as String,
    json['distance'] as String,
  );
}

Map<String, dynamic> _$TourToJson(Tour instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'state': instance.state,
      'distance': instance.distance,
      'time': instance.time,
      'points': instance.points,
    };
