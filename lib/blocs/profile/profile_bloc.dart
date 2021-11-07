import 'package:bloc/bloc.dart';
import 'package:demo_manager/models/get_user_res.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_events.dart';
part 'profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {

  ProfileBloc(): super(ProfileLoadingState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvents event) async*{
    final apiRepository = Api();
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
     // yield ProfileInitState();
      yield ProfileLoadingState();
    }else if(event is ProfileEventStated){
      yield ProfileLoadingState();
      var data = await apiRepository.getUser(token);
      if(data !=null){
        if(data!.status== 1){
          yield ProfileSuccessState(user:data );
        }else if(data.status == 0){
         //////////////////////
        }
      }else{
        yield ProfileErrorState();
      }
    }
  }
}