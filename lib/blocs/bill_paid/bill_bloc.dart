import 'package:demo_manager/models/get_bill_paid_res.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bill_events.dart';
part 'bill_state.dart';


class BillBloc extends Bloc<BillEvents, BillState> {
  BillBloc(): super(BillLoadingState());
  @override
  Stream<BillState> mapEventToState(BillEvents event) async*{
    final apiRepository = Api();
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
      yield BillInitState();
    }else if(event is BillEventStated){
      yield BillLoadingState();
      var data = await apiRepository.getPaidBill(token);
      if(data !=null){
        if(data!.status== 1){
          yield BillLoadedState( billPaid:data );
        }else if(data.status == 0){
          //
        }
      }else{
        yield BillErrorState();
      }
    }
  }
}