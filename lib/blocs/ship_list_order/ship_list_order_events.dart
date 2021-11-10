part of 'ship_list_order_bloc.dart';

abstract class ShipListOrderEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends ShipListOrderEvents {}

class ShipListOrderEventStated extends ShipListOrderEvents {
  // final String token;
  // ProfileEventStated({required this.token});
}