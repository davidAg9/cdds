import 'package:cdds/src/model/user.dart';
import 'package:cdds/src/services/registration_database_service.dart';
import 'package:cdds/src/services/user_database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends HydratedBloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required this.registerService, required this.userService})
      : super(RegistrationInitial()) {
    on<CddsSignInAnonymous>((event, emit) async {
      emit(RegistrationSigning());
      try {
        final user = await registerService.signInAnonymously();
        await userService.saveUser(user);
        emit(SignedState(user));
      } catch (e) {
        emit(RegistrationError());
      }
    });
    on<CddsSignInGoogle>((event, emit) async {
      emit(RegistrationSigning());
      try {
        final user = await registerService.signInGoogly();
        await userService.saveUser(user);
        emit(SignedState(user));
      } catch (e) {
        emit(RegistrationError());
      }
    });
    on<CddsSignInApple>((event, emit) async {
      emit(RegistrationSigning());
      try {
        final user = await registerService.signInApplely();
        await userService.saveUser(user);
        emit(SignedState(user));
      } catch (e) {
        emit(RegistrationError());
      }
    });
  }
  final RegistrationDatabaseInterface registerService;
  final UserDatabaseInterface userService;
  @override
  RegistrationState? fromJson(Map<String, dynamic> json) {
    return SignedState(CDDSUSER.fromDocument(json));
  }

  @override
  Map<String, dynamic>? toJson(RegistrationState state) {
    if (state is SignedState) {
      return state.user.toDocument();
    }
  }
}
