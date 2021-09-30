part of 'cdds_qr_scanner_cubit.dart';

abstract class CddsQrScannerState extends Equatable {
  const CddsQrScannerState();

  @override
  List<Object> get props => [];
}

class CddsQrScannerInitial extends CddsQrScannerState {}

class CddsQrScannerScanning extends CddsQrScannerState {}

class CddsQrScannerComplete extends CddsQrScannerState {
  final String resultText;

  const CddsQrScannerComplete(this.resultText);

  @override
  List<Object> get props => [resultText];
}

class CddsQrScannerError extends CddsQrScannerState {
  final String errMsg;

  const CddsQrScannerError(this.errMsg);
  @override
  List<Object> get props => [errMsg];
}
