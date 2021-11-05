import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildHomeScreen()
    );
  }
}


class BuildHomeScreen extends StatefulWidget {
  const BuildHomeScreen({Key? key}) : super(key: key);

  @override
  _BuildHomeScreenState createState() => _BuildHomeScreenState();
}

class _BuildHomeScreenState extends State<BuildHomeScreen> {
  String _token='';

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
              fontFamily: 'muli',
            ),
          ),
        ),
        actions: [
          Container(
            padding:  const EdgeInsets.fromLTRB(25, 0, 30, 10),
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
        filter: ImageFilter.blur(sigmaX: 80,sigmaY: 80),
        child:Container(
            child: Column(
              children: [
                Container(),
                CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(25, 100, 30, 10),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text("He'd have you all unravel at the"),
                            color: Colors.green[100],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Heed not the rabble'),
                            color: Colors.green[200],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Sound of screams but the'),
                            color: Colors.green[300],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Who scream'),
                            color: Colors.green[400],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Revolution is coming...'),
                            color: Colors.green[500],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Revolution, they...'),
                            color: Colors.green[600],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      )
    );
  }





  void getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('token') ?? "");
    });
  }
}

