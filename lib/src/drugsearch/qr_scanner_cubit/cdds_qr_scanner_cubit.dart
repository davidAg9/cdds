import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cdds_qr_scanner_state.dart';

class CddsQrScannerCubit extends Cubit<CddsQrScannerState> {
  CddsQrScannerCubit() : super(CddsQrScannerInitial());

  Future<void> scan() async {
    emit(CddsQrScannerScanning());
    try {
      ScanResult codeSanner = await BarcodeScanner.scan();
      emit(CddsQrScannerComplete(codeSanner.rawContent));
    } catch (e) {
      emit(const CddsQrScannerError("Could start Scanner Device"));
    }
  }
}
