import 'dart:ui';

import 'package:demo_manager/blocs/profile/profile_bloc.dart';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/models/get_user_res.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/screens/home/services/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bill/bill_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc()..add(ProfileEventStated()),
      child: WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(body: BuildHomeScreen()),

      ),
    );
    // Scaffold(body: BuildHomeScreen());
  }
}

class BuildHomeScreen extends StatefulWidget {
  const BuildHomeScreen({Key? key}) : super(key: key);
  @override
  _BuildHomeScreenState createState() => _BuildHomeScreenState();
}

class _BuildHomeScreenState extends State<BuildHomeScreen> {
  String token = '';

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
            padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
            child: Icon(
              Icons.logout,
              color: Colors.black45,
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {

    GetUserResponse userResponse;
    Size size = MediaQuery.of(context).size;
    final getProfile = BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoadingState){
        return const CircularProgressIndicator();
      }else if (state is ProfileSuccessState){
        userResponse = state.user;
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userResponse.result!.email.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.01,),
              Text(userResponse.result!.name.toString(),overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.01,),
              Text(userResponse.result!.location.toString(),overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),),

            ],
          ),
        );
      }
      else {
        return Container( child: Text("Profile"));
      }
    });
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
                          onTap: (){
                          },
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
                            child: getProfile,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ServiceScreen()),
                            );
                          },
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
                                    "assets/images/service.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Dịch vụ",
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
                                    "assets/images/Utilities.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Tiện ích",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BillScreen()),
                            );
                          },
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
                                    "assets/images/bill.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Hoá đơn",
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
                                    "assets/images/google-maps.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Bản đồ ",
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
                                    "assets/images/bill.png",
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  "Phản ánh",
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
    setState(() {
      token = (prefs.getString('token') ?? "");
    });
  }
}
