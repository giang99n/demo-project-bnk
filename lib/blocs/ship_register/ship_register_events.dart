part of 'ship_register_bloc.dart';

abstract class ShipRegisterEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends ShipRegisterEvents {}

class ShipRegisterButtonPressed extends ShipRegisterEvents {
  final String orderName;
  final String value;
  final String time;
  final bool isChecked;
  final String deliveryTime;

  ShipRegisterButtonPressed(
      this.orderName, this.value, this.time, this.isChecked, this.deliveryTime);
}
