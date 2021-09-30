part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationSigning extends RegistrationState {}

class SignedState extends RegistrationState {
  final CDDSUSER user;

  const SignedState(this.user);

  @override
  List<Object> get props => [user];
}

class RegistrationError extends RegistrationState {}
