part of 'ship_register_bloc.dart';


class ShipRegisterState extends Equatable{

  @override
  List<Object> get props => [];
}

class ShipRegisterInitState extends ShipRegisterState{}

class ShipRegisterLoadingState extends ShipRegisterState{}

class ShipRegisterSuccessState extends ShipRegisterState{}

class ShipRegisterErrorState extends ShipRegisterState{

  final String message;
  ShipRegisterErrorState({required this.message});
}