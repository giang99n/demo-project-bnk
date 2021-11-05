part of 'profile_bloc.dart';


class ProfileState extends Equatable{

  @override
  List<Object> get props => [];
}

class ProfileInitState extends ProfileState{}

class ProfileLoadingState extends ProfileState{}

class ProfileSuccessState extends ProfileState{
  final GetUserResponse user;

  ProfileSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}