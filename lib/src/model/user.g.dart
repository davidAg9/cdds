// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CDDSUSER _$CDDSUSERFromJson(Map<String, dynamic> json) => CDDSUSER(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      scannedDrugs: (json['scannedDrugs'] as List<dynamic>?)
              ?.map((e) => Drug.fromDocument(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CDDSUSERToJson(CDDSUSER instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'scannedDrugs': instance.scannedDrugs.map((e) => e.toDocument()).toList(),
    };
