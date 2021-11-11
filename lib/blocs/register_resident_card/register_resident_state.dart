part of 'register_resident_bloc.dart';

class RegisterResidentState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterResidentInitState extends RegisterResidentState {}

class RegisterResidentLoadingState extends RegisterResidentState {}

class RegisterResidentSuccessState extends RegisterResidentState {}

class RegisterResidentErrorState extends RegisterResidentState {
  final String message;

  RegisterResidentErrorState({required this.message});
}
