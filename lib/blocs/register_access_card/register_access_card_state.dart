part of 'register_access_card_bloc.dart';

class RegisterAccessCardState extends Equatable{
  @override
  List<Object> get props => [];
}

class RegisterAccessCardInitState extends RegisterAccessCardState{}

class RegisterAccessCardLoadingState extends RegisterAccessCardState{}

class RegisterAccessCardSuccessState extends RegisterAccessCardState{}

class RegisterAccessCardErrorState extends RegisterAccessCardState{

  final String message;
  RegisterAccessCardErrorState({required this.message});
}