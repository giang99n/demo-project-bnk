import 'package:demo_manager/blocs/login/login_bloc.dart';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/Screens/Login/components/background.dart';
import 'package:demo_manager/ui/Screens/Signup/signup_screen.dart';
import 'package:demo_manager/ui/components/text_field_container.dart';
import 'package:demo_manager/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();

   LoginBloc? loginBloc ;
   Api? api;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    email.text = 'a1l22@gmail.com';
    password.text = 'alo123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                  child: TextField(
                    controller: email,
                    onChanged: (value){},
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    onChanged: (value){},
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "Mật khẩu",
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        loginBloc!.add(LoginButtonPressed(
                            email: email.text, password: password.text));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don’t have an Account ? ",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
