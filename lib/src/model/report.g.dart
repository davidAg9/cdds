// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      userID: json['userID'] as String,
      drugId: json['drugId'] as String,
      pharmacyName: json['pharmacyName'] as String?,
      title: json['title'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'userID': instance.userID,
      'drugId': instance.drugId,
      'pharmacyName': instance.pharmacyName,
      'title': instance.title,
      'comment': instance.comment,
    };
