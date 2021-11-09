part of 'bill_bloc.dart';

abstract class BillEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends BillEvents {}

class BillEventStated extends BillEvents {
  // final String token;
  // ProfileEventStated({required this.token});
}