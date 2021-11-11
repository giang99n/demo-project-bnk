part of 'register_resident_bloc.dart';

abstract class RegisterResidentEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterResidentEvents {}

class RegisterResidentButtonPressed extends RegisterResidentEvents {
  final String name;

  RegisterResidentButtonPressed({required this.name});
}
