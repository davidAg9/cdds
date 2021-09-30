import 'package:cdds/src/model/drug.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// abstract class AppUser extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class CDDSUSER extends Equatable {
  final String id;
  final String? name;
  final String? email;

  final List<Drug> scannedDrugs;

  const CDDSUSER({required this.id, this.name, required this.email, this.scannedDrugs = const []});

  factory CDDSUSER.fromDocument(Map<String, dynamic> json) => _$CDDSUSERFromJson(json);
  Map<String, dynamic> toDocument() => _$CDDSUSERToJson(this);

  @override
  List<Object?> get props => [id, name, email, scannedDrugs];
}
