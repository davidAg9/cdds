import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cdds/src/drugsearch/qr_scanner_cubit/cdds_qr_scanner_cubit.dart';
import 'package:cdds/src/model/drug.dart';
import 'package:equatable/equatable.dart';

part 'cdds_drug_search_event.dart';
part 'cdds_drug_search_state.dart';

class CddsDrugSearchBloc extends Bloc<CddsDrugSearchEvent, CddsDrugSearchState> {
  CddsDrugSearchBloc(this.qrScannerCubit) : super(CddsDrugSearchInitial()) {
    on<SearchForDrug>((event, emit) {
      if (event.drugName != null) {
        //TODO:search for drug name
      } else if (event.serialORbarcodeNumber != null) {
        //TODO:search for serial number
      }
    });
    on<SearchForWithScan>((event, emit) async {
      qrScannerSubcription?.cancel();
      await qrScannerCubit.scan();
      qrScannerSubcription = qrScannerCubit.stream.listen((state) {
        if (state is CddsQrScannerScanning) {
          emit(CddsDrugSearchLoading());
        } else if (state is CddsQrScannerComplete) {
          add(SearchForDrug(serialORbarcodeNumber: state.resultText));
        } else if (state is CddsQrScannerError) {
          emit(CddsDrugSearchError());
        }
      });
    });
  }
  final CddsQrScannerCubit qrScannerCubit;
  StreamSubscription<CddsQrScannerState>? qrScannerSubcription;

  @override
  Future<void> close() {
    qrScannerSubcription?.cancel();
    qrScannerCubit.close();

    return super.close();
  }
}
