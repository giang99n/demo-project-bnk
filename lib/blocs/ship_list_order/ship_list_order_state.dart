part of 'ship_list_order_bloc.dart';


class ShipListOrderState extends Equatable{

  @override
  List<Object> get props => [];
}

class ShipListOrderInitState extends ShipListOrderState{}

class ShipListOrderLoadingState extends ShipListOrderState{}
class ShipListOrderErrorState extends ShipListOrderState{}
class ShipListOrderLoadedState extends ShipListOrderState{
  final ShipListOrderResponse shipListOrderResponse;

  ShipListOrderLoadedState({required this.shipListOrderResponse});

  @override
  List<Object> get props => [shipListOrderResponse];
}