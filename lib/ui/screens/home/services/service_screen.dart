import 'dart:ui';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BuildServiceScreen());
  }
}

class BuildServiceScreen extends StatefulWidget {
  const BuildServiceScreen({Key? key}) : super(key: key);


  // BuildServiceScreen(){
  //   Api api=new Api();
  //   api.getUser("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTFjYjhhMGM1NzM2ZjA4NTQxODcxNTAiLCJpYXQiOjE2MzYwODI3MTUsImV4cCI6MTYzNjY4NzUxNX0.mPjNjbe_0J9v7oMmVAAZTrv16mO3tq_qzYxcwYn2n48");
  // }

  @override
  _BuildServiceScreenState createState() => _BuildServiceScreenState();
}

class _BuildServiceScreenState extends State<BuildServiceScreen> {

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(true),
          color: Colors.black45,
        ),
        title: Center(
          child: Text(
            'Dịch vụ'.toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
            // child:  Icon(
            //   Icons.logout,
            //   color: Colors.black45,
            // ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    "assets/images/shopping-cart.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Nhận hàng hộ",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    "assets/images/credit-card.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Thẻ cư dân",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Image.asset(
                                  "assets/images/people.png",
                                  width: size.width * 0.1,
                                ),
                              ),
                              Text(
                                "Nhân khẩu",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),

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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    "assets/images/car.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Thẻ xe",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),

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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    "assets/images/coffee.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Khách lên nhà",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),

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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    "assets/images/log-out.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Thẻ ra vào",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),

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
  }
}