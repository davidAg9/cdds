part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class CddsSignInAnonymous extends RegistrationEvent {
  const CddsSignInAnonymous();
}

class CddsSignInGoogle extends RegistrationEvent {}

class CddsSignInApple extends RegistrationEvent {}
