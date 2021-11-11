import 'package:bloc/bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_resident_events.dart';

part 'register_resident_state.dart';

class RegisterResidentBloc
    extends Bloc<RegisterResidentEvents, RegisterResidentState> {
  Api apiRepository;

  RegisterResidentBloc(RegisterResidentState initialState, this.apiRepository)
      : super(initialState);

  @override
  Stream<RegisterResidentState> mapEventToState(
      RegisterResidentEvents event) async* {
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if (event is StartEvent) {
      yield RegisterResidentInitState();
    } else if (event is RegisterResidentButtonPressed) {
      yield RegisterResidentLoadingState();
      var data =
          await apiRepository.RegisterResident(name: event.name, token: token);
      if (data != null) {
        if (data!.status == 1) {
          yield RegisterResidentSuccessState();
        } else if (data.status == 0) {
          print("user exists");
          yield RegisterResidentErrorState(message: "user exists");
        }
      } else {
        print('data null');
      }
    }
  }
}
