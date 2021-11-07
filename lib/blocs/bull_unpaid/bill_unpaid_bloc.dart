import 'package:demo_manager/models/get_bill_paid_res.dart';
import 'package:demo_manager/models/get_bill_unpaid_res.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bill_unpaid_events.dart';
part 'bill_unpaid_state.dart';


class BillUnpaidBloc extends Bloc<BillUnpaidEvents, BillUnpaidState> {
  BillUnpaidBloc(): super(BillUnpaidLoadingState());
  @override
  Stream<BillUnpaidState> mapEventToState(BillUnpaidEvents event) async*{
    final apiRepository = Api();
    final pref = await SharedPreferences.getInstance();
    String token = (pref.getString('token') ?? "");
    if(event is StartEvent){
      yield BillInitState();
    }else if(event is BillUnpaidEventStated){
      yield BillUnpaidLoadingState();
      var data = await apiRepository.getUnpaidBill(token);
      if(data !=null){
        if(data!.status== 1){
          yield BillUnpaidLoadedState( billUnpaid:data );
        }else if(data.status == 0){
          yield BillUnpaidErrorState();
        }
      }else{
        yield BillUnpaidErrorState();
      }
    }
  }
}