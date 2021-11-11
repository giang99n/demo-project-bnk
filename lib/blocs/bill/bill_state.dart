part of 'bill_bloc.dart';

class BillState extends Equatable {
  @override
  List<Object> get props => [];
}

class BillInitState extends BillState {}

class BillLoadingState extends BillState {}

class BillErrorState extends BillState {}

class BillLoadedState extends BillState {
  final BillResponse bill;

  BillLoadedState({required this.bill});

  @override
  List<Object> get props => [bill];
}
