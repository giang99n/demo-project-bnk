part of 'bill_unpaid_bloc.dart';

abstract class BillUnpaidEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends BillUnpaidEvents {}

class BillUnpaidEventStated extends BillUnpaidEvents {
  // final String token;
  // ProfileEventStated({required this.token});
}