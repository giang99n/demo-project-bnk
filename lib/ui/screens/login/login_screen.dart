import 'package:demo_manager/blocs/login/login_bloc.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/Screens/Login/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginBloc(LoginInitState(), Api()))
      ],
      child: Body(),
    );
  }
}
