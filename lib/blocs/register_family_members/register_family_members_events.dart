part of 'register_family_members_bloc.dart';

abstract class RegisterFamilyMemberEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterFamilyMemberEvents {}

class RegisterFamilyMemberButtonPressed extends RegisterFamilyMemberEvents {
  final String name;

  RegisterFamilyMemberButtonPressed({required this.name});
}
