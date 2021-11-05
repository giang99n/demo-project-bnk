import 'dart:ui';

import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BuildHomeScreen());
  }
}

class BuildHomeScreen extends StatefulWidget {
  const BuildHomeScreen({Key? key}) : super(key: key);


  // BuildHomeScreen(){
  //   Api api=new Api();
  //   api.getUser("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTFjYjhhMGM1NzM2ZjA4NTQxODcxNTAiLCJpYXQiOjE2MzYwODI3MTUsImV4cCI6MTYzNjY4NzUxNX0.mPjNjbe_0J9v7oMmVAAZTrv16mO3tq_qzYxcwYn2n48");
  // }

  @override
  _BuildHomeScreenState createState() => _BuildHomeScreenState();
}

class _BuildHomeScreenState extends State<BuildHomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black45,
        ),
        title: Center(
          child: Text(
            'BNK'.toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 30, 0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Background0.jpg'),
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
          child: Container(
              child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(25, 100, 30, 10),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){ },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Text("Profile"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Text("Dịch vụ"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Text("Hóa đơn"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Text("ABCABC"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Text("ABCABC"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: const Text("ABCABC"),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          )),
        ));
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('token') ?? "");
    });
  }
}
