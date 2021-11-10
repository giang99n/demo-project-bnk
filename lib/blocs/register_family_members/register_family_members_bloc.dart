import 'package:bloc/bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_family_members_events.dart';
part 'register_family_members_state.dart';

class RegisterFamilyMemberBloc extends Bloc<RegisterFamilyMemberEvents, RegisterFamilyMemberState> {
  Api apiRepository;
  RegisterFamilyMemberBloc(RegisterFamilyMemberState initialState,this.apiRepository ): super(initialState);

  @override
  Stream<RegisterFamilyMemberState> mapEventToState(RegisterFamilyMemberEvents event) async*{
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
      yield RegisterFamilyMemberInitState();
    }else if(event is RegisterFamilyMemberButtonPressed){
      yield RegisterFamilyMemberLoadingState();
      var data = await apiRepository.RegisterResident(name: event.name, token: token);
      if(data !=null){
        if(data!.status == 1){
          yield RegisterFamilyMemberSuccessState();
        }else if(data.status == 0){
          print("user exists");
          yield RegisterFamilyMemberErrorState( message: "user exists");
        }
      }else{
        print('data null');
      }
    }
  }
}