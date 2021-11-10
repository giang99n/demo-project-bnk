import 'dart:ui';
import 'package:demo_manager/blocs/register_access_card/register_access_card_bloc.dart';
import 'package:demo_manager/blocs/register_family_members/register_family_members_bloc.dart';
import 'package:demo_manager/blocs/register_resident_card/register_resident_bloc.dart';
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

class RegisterAccessCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> RegisterAccessCardBloc(RegisterAccessCardInitState(), Api()))
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
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController inDenTiTyCard = TextEditingController();
  TextEditingController moveInDate = TextEditingController();
  TextEditingController moveOutDate = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController relationship = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Api? api;
  RegisterAccessCardBloc? registerAccessCardBloc;

  @override
  void initState() {
    registerAccessCardBloc = BlocProvider.of<RegisterAccessCardBloc>(context);
    name.text = 'Hà Duy Hiếu';
    dateOfBirth.text = '30-03-1999';
    inDenTiTyCard.text = '123456789';
    moveInDate.text = '10-11-2021';
    moveOutDate.text='15-11-2021';
    phoneNumber.text = '0988888888';
    relationship.text = 'anh';
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
            'Đăng ký thẻ ra vào'.toUpperCase(),
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
    final msg = BlocBuilder<RegisterAccessCardBloc, RegisterAccessCardState>(
        builder: (context, state) {
          if (state is RegisterAccessCardLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is RegisterAccessCardErrorState) {
            return Text(state.message);
          } else {
            return Container();
          }
        });
    return
      Scaffold(
        body: BlocListener<RegisterAccessCardBloc, RegisterAccessCardState>(
          listener: (context, state) {
            if (state is RegisterAccessCardSuccessState) {
              Fluttertoast.showToast(msg: "Đăng kí thành công");
              setState(() {
                name.text = '';
                dateOfBirth.text = '';
                inDenTiTyCard.text = '';
                moveInDate.text = '';
                phoneNumber.text = '';
                relationship.text = '';
                moveOutDate.text = '';
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
                            onTap: () async {
                              FocusScope.of(context).requestFocus(new FocusNode());
                              // Show Date Picker Here
                              DateTime? date;
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021),
                                  lastDate: DateTime(2100));

                              dateOfBirth.text = DateFormat('dd-MM-yyyy').format(date);
                            },
                            controller: dateOfBirth,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              labelText: "Ngày sinh",
                              icon: Icon(
                                Icons.calendar_today_sharp,
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
                                  return registerAccessCardBloc!.add(RegisterAccessCardButtonPressed(
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
