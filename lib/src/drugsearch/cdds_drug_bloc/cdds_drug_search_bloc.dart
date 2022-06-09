import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cdds/src/drugsearch/qr_scanner_cubit/cdds_qr_scanner_cubit.dart';
import 'package:cdds/src/model/drug.dart';
import 'package:cdds/src/services/drug_database_service.dart';
import 'package:equatable/equatable.dart';

part 'cdds_drug_search_event.dart';
part 'cdds_drug_search_state.dart';

class CddsDrugSearchBloc extends Bloc<CddsDrugSearchEvent, CddsDrugSearchState> {
  CddsDrugSearchBloc({required this.qrScannerCubit, required this.drugDb})
      : super(CddsDrugSearchInitial()) {
    on<SearchForDrug>((event, emit) async {
      emit(CddsDrugSearchLoading());
      try {
        final result = await drugDb.findDrug(event.drugName);
        if (result != null) {
          emit(CddsDrugSearchLoaded(result));
        }
      } catch (e) {
        emit(CddsDrugSearchError());
      }
    });
    on<SearchForWithScan>((event, emit) async {
      qrScannerSubcription?.cancel();
      await qrScannerCubit.scan();
      qrScannerSubcription = qrScannerCubit.stream.listen((state) {
        if (state is CddsQrScannerScanning) {
          emit(CddsDrugSearchLoading());
        } else if (state is CddsQrScannerComplete) {
          add(SearchForDrug(drugName: state.resultText));
        } else if (state is CddsQrScannerError) {
          emit(CddsDrugSearchError());
        }
      });
    });
  }
  final CddsQrScannerCubit qrScannerCubit;
  StreamSubscription<CddsQrScannerState>? qrScannerSubcription;
  final DrugDatabaseInterface drugDb;
  @override
  Future<void> close() {
    qrScannerSubcription?.cancel();
    qrScannerCubit.close();

    return super.close();
  }
}
