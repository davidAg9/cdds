import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'report.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class Report extends Equatable {
  final String userID;
  final String drugId;
  final String? pharmacyName;
  final String? title;
  final String? comment;
  const Report({
    required this.userID,
    required this.drugId,
    this.pharmacyName,
    this.title,
    this.comment,
  });

  factory Report.fromDocument(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toDocument() => _$ReportToJson(this);
  @override
  List<Object?> get props => [userID, drugId, title, comment, pharmacyName];
}
