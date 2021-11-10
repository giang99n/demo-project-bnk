import 'package:bloc/bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ship_register_events.dart';
part 'ship_register_state.dart';

class ShipRegisterBloc extends Bloc<ShipRegisterEvents, ShipRegisterState> {
  Api apiRepository;
  ShipRegisterBloc(ShipRegisterState initialState,this.apiRepository ): super(initialState);

  @override
  Stream<ShipRegisterState> mapEventToState(ShipRegisterEvents event) async*{
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
      yield ShipRegisterInitState();
    }else if(event is ShipRegisterButtonPressed){
      print('ShipRegisterButtonPressed');
      yield ShipRegisterLoadingState();
      var data = await apiRepository.shipRegister(event.orderName,event.value,event.time,event.isChecked,event.deliveryTime,token: token);
      if(data !=null){
        if(data!.status == 1){

          yield ShipRegisterSuccessState();
        }else if(data.status == 0){
          yield ShipRegisterErrorState( message: data.message ?? "thất bại");/////////////////////////
        }
      }else{
        print('data null');
      }
    }
  }

}