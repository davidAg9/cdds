import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'drug.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class Drug extends Equatable {
  String dbId;
  String name;
  String? imageUrl;
  DateTime registrationDate;
  DateTime? expiryDate;
  String strength;
  String representativeCompany;
  String manufacturer;
  String registrationNumber;

  DrugStatus drugExpiryStatus;

  Drug({
    required this.dbId,
    required this.name,
    required this.registrationDate,
    required this.expiryDate,
    required this.strength,
    required this.registrationNumber,
    required this.manufacturer,
    this.imageUrl,
    required this.representativeCompany,
    this.drugExpiryStatus = DrugStatus.safe,
  }) {
    if (expiryDate == null) {
      drugExpiryStatus = DrugStatus.unknown;
    } else if (expiryDate != null && expiryDate!.isAfter(DateTime.now())) {
      drugExpiryStatus = DrugStatus.expired;
    } else if (expiryDate != null &&
        expiryDate!.isBefore(DateTime.now()) &&
        DateTime.now().difference(expiryDate!).inDays < 15) {
      drugExpiryStatus = DrugStatus.expired;
    } else {
      drugExpiryStatus = DrugStatus.safe;
    }
  }

  factory Drug.fromDocument(Map<String, dynamic> json) => _$DrugFromJson(json);
  Map<String, dynamic> toDocument() => _$DrugToJson(this);
  @override
  List<Object?> get props => [
        dbId,
        name,
        imageUrl,
        registrationDate,
        expiryDate,
        strength,
        representativeCompany,
        manufacturer,
        registrationNumber,
        drugExpiryStatus
      ];
}

enum DrugStatus { expired, safe, unknown }
