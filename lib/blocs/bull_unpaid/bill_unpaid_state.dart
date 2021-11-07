part of 'bill_unpaid_bloc.dart';


class BillUnpaidState extends Equatable{

  @override
  List<Object> get props => [];
}

class BillInitState extends BillUnpaidState{}

class BillUnpaidLoadingState extends BillUnpaidState{}
class BillUnpaidErrorState extends BillUnpaidState{}
class BillUnpaidLoadedState extends BillUnpaidState{
  final BillUnpaid billUnpaid;

  BillUnpaidLoadedState({required this.billUnpaid});

  @override
  List<Object> get props => [billUnpaid];
}