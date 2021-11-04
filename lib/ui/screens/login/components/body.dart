import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/ui/Screens/Login/components/background.dart';
import 'package:demo_manager/ui/Screens/Signup/signup_screen.dart';
import 'package:demo_manager/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../routes.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            TextField(
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
            TextField(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
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
    );
  }
}
