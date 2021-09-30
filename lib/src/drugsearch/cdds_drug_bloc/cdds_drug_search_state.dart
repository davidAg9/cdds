part of 'cdds_drug_search_bloc.dart';

abstract class CddsDrugSearchState extends Equatable {
  const CddsDrugSearchState();

  @override
  List<Object> get props => [];
}

class CddsDrugSearchInitial extends CddsDrugSearchState {}

class CddsDrugSearchLoading extends CddsDrugSearchState {}

class CddsDrugSearchLoaded extends CddsDrugSearchState {
  final Drug drug;

  const CddsDrugSearchLoaded(this.drug);
  @override
  List<Object> get props => [drug];
}

class CddsDrugSearchError extends CddsDrugSearchState {}
