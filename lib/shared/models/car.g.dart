// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      handel_name: json['handel_name'] as String? ?? "",
      hersteller_name: json['hersteller_name'] as String? ?? "",
      error: json['error'] as String? ?? "",
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'handel_name': instance.handel_name,
      'hersteller_name': instance.hersteller_name,
      'error': instance.error,
    };
