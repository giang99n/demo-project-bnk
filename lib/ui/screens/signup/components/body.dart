import 'package:demo_manager/blocs/login/login_bloc.dart';
import 'package:demo_manager/blocs/signup/signup_bloc.dart';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/Screens/Login/login_screen.dart';
import 'package:demo_manager/ui/Screens/Signup/components/background.dart';
import 'package:demo_manager/ui/Screens/Signup/components/social_icon.dart';
import 'package:demo_manager/ui/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  SignupBloc? signupBloc;
  Api? api;

  @override
  void initState() {
    signupBloc = BlocProvider.of<SignupBloc>(context);
    email.text = 'alo112233@gmail.com';
    password.text = 'alo123';
    confirmPassword.text = 'alo123';
    name.text = 'hello';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final msg = BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      if (state is SignupLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is SignupErrorState) {
        return Text(state.message);
      } else {
        return Container();
      }
    });
    return Scaffold(
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        child: Background(
          child: SingleChildScrollView(
              child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.3,
                ),
                TextFieldContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Hãy điền đủ thông tin';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      name = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    controller: email,
                    cursorColor: kPrimaryColor,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+(.)+[a-zA-Z0-9-]*$')
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                    },
                    onSaved: (String? value) {
                      email = value as TextEditingController;
                    },
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
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please a Enter Password';
                      } else if (value!.length < 6) {
                        return 'password is too short ';
                      }
                      return null;
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "Password",
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
                TextFieldContainer(
                  child: TextFormField(
                    controller: confirmPassword,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmPassword.text);

                      if (password.text != confirmPassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print("successful");
                          return signupBloc!.add(SignupButtonPressed(
                              name: name.text,
                              email: email.text,
                              password: password.text));
                        } else {
                          print("UnSuccessfull");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                msg,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an Account ? ",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  width: size.width * 0.8,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          height: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
