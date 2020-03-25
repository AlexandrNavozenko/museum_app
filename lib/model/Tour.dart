import 'package:json_annotation/json_annotation.dart';

part 'Tour.g.dart';

@JsonSerializable()
class Tour {
  final String id;
  final String name;
  final String city;
  final String state;
  final String distance;
  final String time;
  final String points;
  final String picture;
  final String keyboard;

  Tour(this.id, this.name, this.time, this.points, this.picture, this.city,
      this.state, this.distance, this.keyboard);

  factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);

//  Tour.fromJson(Map<String, dynamic> json)
//      : id = json['id'],
//        name = json['name'],
//        city = json['city'],
//        state = json['state'],
//        distance = json['distance'],
//        time = json['time'],
//        points = json['points'],
//        picture = json['picture'],
//        keyboard = json['keyboard'];

}
