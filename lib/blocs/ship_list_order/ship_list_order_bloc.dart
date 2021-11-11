import 'package:demo_manager/models/ship_list_order_res.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ship_list_order_events.dart';

part 'ship_list_order_state.dart';

class ShipListOrderBloc extends Bloc<ShipListOrderEvents, ShipListOrderState> {
  ShipListOrderBloc() : super(ShipListOrderLoadingState());

  @override
  Stream<ShipListOrderState> mapEventToState(ShipListOrderEvents event) async* {
    final apiRepository = Api();
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if (event is StartEvent) {
      yield ShipListOrderInitState();
    } else if (event is ShipListOrderEventStated) {
      yield ShipListOrderLoadingState();
      var data = await apiRepository.getShipListOrder(token);
      if (data != null) {
        if (data!.status == 1) {
          yield ShipListOrderLoadedState(shipListOrderResponse: data);
        } else if (data.status == 0) {
          //
        }
      } else {
        yield ShipListOrderErrorState();
      }
    }
  }
}
