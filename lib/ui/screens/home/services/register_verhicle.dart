import 'dart:ui';
import 'package:demo_manager/blocs/register_access_card/register_access_card_bloc.dart';
import 'package:demo_manager/blocs/register_family_members/register_family_members_bloc.dart';
import 'package:demo_manager/blocs/register_resident_card/register_resident_bloc.dart';
import 'package:demo_manager/blocs/register_verhicle/register_verhicle_bloc.dart';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/components/text_field_container2.dart';
import 'package:demo_manager/ui/components/text_field_container.dart';
import 'package:demo_manager/ui/screens/home/services/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterVerhicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> RegisterVerhicleBloc(RegisterVerhicleInitState(), Api()))
      ],
      child: BuildResidentCardScreen(),
    );
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
  TextEditingController inDenTiTyCard = TextEditingController();
  TextEditingController verHiCle = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController licensePlate = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController relationship = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Api? api;
  RegisterVerhicleBloc? registerVerhicleBloc;

  @override
  void initState() {
    registerVerhicleBloc = BlocProvider.of<RegisterVerhicleBloc>(context);
    name.text = 'Hà Duy Hiếu';
    inDenTiTyCard.text = '123456789';
    verHiCle.text = 'Ôtô';
    brand.text='Mercedes';
    licensePlate.text = '30B1-8888';
    color.text = 'Trắng';
    phoneNumber.text = '0988888888';
    relationship.text = 'Anh';
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
            'Đăng ký thẻ xe'.toUpperCase(),
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
    final msg = BlocBuilder<RegisterVerhicleBloc, RegisterVerhicleState>(
        builder: (context, state) {
          if (state is RegisterVerhicleLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is RegisterVerhicleErrorState) {
            return Text(state.message);
          } else {
            return Container();
          }
        });
    return
      Scaffold(
        body: BlocListener<RegisterVerhicleBloc, RegisterVerhicleState>(
          listener: (context, state) {
            if (state is RegisterVerhicleSuccessState) {
              Fluttertoast.showToast(msg: "Đăng kí thành công");
              setState(() {
                name.text = '';
                inDenTiTyCard.text = '';
                verHiCle.text = '';
                brand.text='';
                licensePlate.text = '';
                color.text = '';
                phoneNumber.text = '';
                relationship.text = '';
              });
            }
          },
          child: Container(
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
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          width: size.width * 0.9,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Thông tin người được đăng ký",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                                return 'Hãy điền đủ thông tin';
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
                            controller: phoneNumber,
                            cursorColor: kPrimaryColor,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              phoneNumber = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "Số điện thoại",
                              icon: Icon(
                                Icons.phone,
                                color: kPrimaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextContainer(
                          child: TextFormField(
                            controller: inDenTiTyCard,
                            cursorColor: kPrimaryColor,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              inDenTiTyCard = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "Số CMND|CCCD",
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
                            controller: relationship,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              relationship = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "Mối quan hệ với chủ sở hữu",
                              icon: Icon(
                                Icons.group_add_outlined,
                                color: kPrimaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextContainer(
                          child: TextFormField(
                            controller: verHiCle,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              verHiCle = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "loại phương tiện",
                              icon: Icon(
                                Icons.car_repair,
                                color: kPrimaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextContainer(
                          child: TextFormField(
                            controller: brand,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              brand = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "Nhãn hiệu",
                              icon: Icon(
                                Icons.branding_watermark_outlined,
                                color: kPrimaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextContainer(
                          child: TextFormField(
                            controller: licensePlate,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              licensePlate = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "Biển số",
                              icon: Icon(
                                Icons.branding_watermark_outlined,
                                color: kPrimaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        TextContainer(
                          child: TextFormField(
                            controller: color,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {},
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Hãy điền đủ thông tin';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                             color = value as TextEditingController;
                            },
                            decoration: InputDecoration(
                              labelText: "Màu sắc",
                              icon: Icon(
                                Icons.color_lens_outlined,
                                color: kPrimaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ElevatedButton(
                              child: Text(
                                "Xác nhận đăng kí",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  print("successful");
                                  return registerVerhicleBloc!.add(RegisterVerhicleButtonPressed(
                                      name: name.text));
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
                      ],
                    ),
                  ),
                ),
              )),
        ),
      );
  }
}
