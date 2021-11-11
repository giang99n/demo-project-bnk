part of 'register_access_card_bloc.dart';

abstract class RegisterAccessCardEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterAccessCardEvents {}

class RegisterAccessCardButtonPressed extends RegisterAccessCardEvents {
  final String name;

  RegisterAccessCardButtonPressed({required this.name});
}
