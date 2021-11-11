part of 'register_family_members_bloc.dart';

class RegisterFamilyMemberState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterFamilyMemberInitState extends RegisterFamilyMemberState {}

class RegisterFamilyMemberLoadingState extends RegisterFamilyMemberState {}

class RegisterFamilyMemberSuccessState extends RegisterFamilyMemberState {}

class RegisterFamilyMemberErrorState extends RegisterFamilyMemberState {
  final String message;

  RegisterFamilyMemberErrorState({required this.message});
}
