part of 'register_verhicle_bloc.dart';

class RegisterVerhicleState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterVerhicleInitState extends RegisterVerhicleState {}

class RegisterVerhicleLoadingState extends RegisterVerhicleState {}

class RegisterVerhicleSuccessState extends RegisterVerhicleState {}

class RegisterVerhicleErrorState extends RegisterVerhicleState {
  final String message;

  RegisterVerhicleErrorState({required this.message});
}
