part of 'register_verhicle_bloc.dart';
abstract class RegisterVerhicleEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterVerhicleEvents {}

class RegisterVerhicleButtonPressed extends RegisterVerhicleEvents {
  final String name;
  RegisterVerhicleButtonPressed({ required this.name});

}