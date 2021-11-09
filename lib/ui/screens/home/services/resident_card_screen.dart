import 'dart:ui';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/components/text_field_container2.dart';
import 'package:demo_manager/ui/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResidentCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BuildResidentCardScreen());
  }
}

class BuildResidentCardScreen extends StatefulWidget {
  const BuildResidentCardScreen({Key? key}) : super(key: key);

  @override
  _BuildResidentCardScreenState createState() =>
      _BuildResidentCardScreenState();
}

class _BuildResidentCardScreenState extends State<BuildResidentCardScreen> {
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Đăng ký thẻ cư dân'.toUpperCase(),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  width: size.width * 0.9,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Thông tin người được đăng ký",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      name = value as TextEditingController;
                    },
                    decoration: InputDecoration(
                      labelText: "Họ và tên",
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
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
                      hintText: "Ngày sinh",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
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
                      hintText: "Giới tính",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
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
                      hintText: "Số CMND|CCCD",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
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
                      hintText: "Ngày cấp",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
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
                      hintText: "Nơi cấp",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
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
                      hintText: "Mối quan hệ với chủ sở hữu",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
