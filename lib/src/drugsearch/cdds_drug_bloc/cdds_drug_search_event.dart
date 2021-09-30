part of 'cdds_drug_search_bloc.dart';

abstract class CddsDrugSearchEvent extends Equatable {
  const CddsDrugSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchForDrug extends CddsDrugSearchEvent {
  final String? drugName;
  final String? serialORbarcodeNumber;

  const SearchForDrug({this.drugName, this.serialORbarcodeNumber});

  @override
  List<Object?> get props => [drugName, serialORbarcodeNumber];
}

class SearchForWithScan extends CddsDrugSearchEvent {}
