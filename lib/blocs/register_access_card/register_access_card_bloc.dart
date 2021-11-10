import 'package:bloc/bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_access_card_events.dart';
part 'register_access_card_state.dart';

class RegisterAccessCardBloc extends Bloc<RegisterAccessCardEvents, RegisterAccessCardState> {
  Api apiRepository;
  RegisterAccessCardBloc(RegisterAccessCardState initialState,this.apiRepository ): super(initialState);

  @override
  Stream<RegisterAccessCardState> mapEventToState(RegisterAccessCardEvents event) async*{
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
      yield RegisterAccessCardInitState();
    }else if(event is RegisterAccessCardButtonPressed){
      yield RegisterAccessCardLoadingState();
      var data = await apiRepository.RegisterResident(name: event.name, token: token);
      if(data !=null){
        if(data!.status == 1){
          yield RegisterAccessCardSuccessState();
        }else if(data.status == 0){
          print("user exists");
          yield RegisterAccessCardErrorState( message: "user exists");
        }
      }else{
        print('data null');
      }
    }
  }
}