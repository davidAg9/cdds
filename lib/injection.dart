import 'package:cdds/src/drugsearch/cdds_drug_bloc/cdds_drug_search_bloc.dart';
import 'package:cdds/src/drugsearch/qr_scanner_cubit/cdds_qr_scanner_cubit.dart';
import 'package:cdds/src/registration/bloc/registration_bloc.dart';
import 'package:cdds/src/services/drug_database_service.dart';
import 'package:cdds/src/services/registration_database_service.dart';
import 'package:cdds/src/services/report_database_service.dart';
import 'package:cdds/src/services/user_database_service.dart';
import 'package:get_it/get_it.dart';

GetIt dp = GetIt.instance;

Future<void> initDep() async {
  //!bloc dependencies
  dp.registerSingleton<CddsQrScannerCubit>(CddsQrScannerCubit());
  dp.registerFactory<CddsDrugSearchBloc>(() => CddsDrugSearchBloc(dp()));
  dp.registerFactory<RegistrationBloc>(
      () => RegistrationBloc(registerService: dp(), userService: dp()));
  //!services
  dp.registerFactory<RegistrationDatabaseInterface>(() => RegistrationDatabaseService());
  dp.registerSingleton<ReportDatabaseInterface>(ReportDatabaseService());
  dp.registerSingleton<UserDatabaseInterface>(UserDatabaseService());
  dp.registerSingleton<DrugDatabaseInterface>(DrugDatabaseService());
}
