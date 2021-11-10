import 'package:bloc/bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_verhicle_state.dart';
part 'register_verhicle_events.dart';

class RegisterVerhicleBloc extends Bloc<RegisterVerhicleEvents, RegisterVerhicleState> {
  Api apiRepository;
  RegisterVerhicleBloc(RegisterVerhicleState initialState,this.apiRepository ): super(initialState);

  @override
  Stream<RegisterVerhicleState> mapEventToState(RegisterVerhicleEvents event) async*{
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
      yield RegisterVerhicleInitState();
    }else if(event is RegisterVerhicleButtonPressed){
      yield RegisterVerhicleLoadingState();
      var data = await apiRepository.RegisterResident(name: event.name, token: token);
      if(data !=null){
        if(data!.status == 1){
          yield RegisterVerhicleSuccessState();
        }else if(data.status == 0){
          print("user exists");
          yield RegisterVerhicleErrorState( message: "user exists");
        }
      }else{
        print('data null');
      }
    }
  }
}