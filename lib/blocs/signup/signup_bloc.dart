import 'package:bloc/bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_events.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvents, SignupState> {
  Api apiRepository;
  SignupBloc(SignupState initialState,this.apiRepository ): super(initialState);

  @override
  Stream<SignupState> mapEventToState(SignupEvents event) async*{
    final pref = await SharedPreferences.getInstance();
    if(event is StartEvent){
      yield SignupInitState();
    }else if(event is SignupButtonPressed){
      yield SignupLoadingState();
      var data = await apiRepository.Signup(event.name,event.email, event.password);
      if(data !=null){
        if(data!.status == 1){
          pref.setString('status', data!.status.toString() ?? "" );
          yield SignupSuccessState();
        }else if(data.status == 0){
          SignupErrorState( message: 'data.message');
        }
      }else{
        print('data null');
      }
    }
  }



}