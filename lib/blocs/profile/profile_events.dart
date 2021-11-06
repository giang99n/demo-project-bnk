part of 'profile_bloc.dart';

abstract class ProfileEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends ProfileEvents {}

class ProfileEventStated extends ProfileEvents {
  // final String token;
  // ProfileEventStated({required this.token});
}