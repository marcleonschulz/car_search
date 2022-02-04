import 'package:json_annotation/json_annotation.dart';
part 'car.g.dart';

@JsonSerializable()
class Car {
  String handel_name;
  String hersteller_name;
  String error;
  Car({this.handel_name = "",this.hersteller_name = "", this.error=""});
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
  Map<String, dynamic> toJson() => _$CarToJson(this);
}