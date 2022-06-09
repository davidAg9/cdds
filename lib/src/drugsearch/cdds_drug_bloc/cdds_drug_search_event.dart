part of 'cdds_drug_search_bloc.dart';

abstract class CddsDrugSearchEvent extends Equatable {
  const CddsDrugSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchForDrug extends CddsDrugSearchEvent {
  final String drugName;

  const SearchForDrug({required this.drugName,});

  @override
  List<Object?> get props => [drugName];
}

class SearchForWithScan extends CddsDrugSearchEvent {}
