import 'package:demo_manager/blocs/signup/signup_bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/Screens/Signup/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> SignupBloc(SignupInitState(), Api()))
      ],
      child: Body(),
    );
  }
}
