import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/ui/Screens/Login/login_screen.dart';
import 'package:demo_manager/ui/Screens/Signup/components/background.dart';
import 'package:demo_manager/ui/Screens/Signup/components/or_divider.dart';
import 'package:demo_manager/ui/Screens/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../routes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
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
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextField(
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
            TextField(
              obscureText: true,
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
            TextField(
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Nhập lại mật khẩu",
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
                  onPressed: (){},
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
                  "Already have an Account ? ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
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
      ),
    );
  }
}
