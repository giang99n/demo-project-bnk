part of 'bill_bloc.dart';


class BillState extends Equatable{

  @override
  List<Object> get props => [];
}

class BillInitState extends BillState{}

class BillLoadingState extends BillState{}
class BillErrorState extends BillState{}
class BillLoadedState extends BillState{
  final BillPaid billPaid;

  BillLoadedState({required this.billPaid});

  @override
  List<Object> get props => [billPaid];
}