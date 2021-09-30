// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      dbId: json['dbId'] as String,
      name: json['name'] as String,
      registrationDate: DateTime.parse(json['registrationDate'] as String),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      strength: json['strength'] as String,
      registrationNumber: json['registrationNumber'] as String,
      manufacturer: json['manufacturer'] as String,
      imageUrl: json['imageUrl'] as String?,
      representativeCompany: json['representativeCompany'] as String,
      drugExpiryStatus:
          _$enumDecodeNullable(_$DrugStatusEnumMap, json['drugExpiryStatus']) ??
              DrugStatus.safe,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'dbId': instance.dbId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'strength': instance.strength,
      'representativeCompany': instance.representativeCompany,
      'manufacturer': instance.manufacturer,
      'registrationNumber': instance.registrationNumber,
      'drugExpiryStatus': _$DrugStatusEnumMap[instance.drugExpiryStatus],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$DrugStatusEnumMap = {
  DrugStatus.expired: 'expired',
  DrugStatus.safe: 'safe',
  DrugStatus.unknown: 'unknown',
};
