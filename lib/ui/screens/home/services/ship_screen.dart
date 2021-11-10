import 'dart:ui';
import 'package:demo_manager/blocs/bill/bill_bloc.dart';
import 'package:demo_manager/blocs/ship_register/ship_register_bloc.dart';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/configs/constants.dart';
import 'package:demo_manager/models/bill_res.dart';
import 'package:demo_manager/network/apis.dart';
import 'package:demo_manager/ui/components/text_field_container2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class ShipScreen extends StatelessWidget {
  const ShipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ShipRegisterBloc>(
              create: (context) => ShipRegisterBloc(ShipRegisterInitState(),Api())
          ),


        ],
        child: Scaffold(
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(true),
              icon: const Icon(Icons.arrow_back_rounded),
              color: Colors.black54,
            ),
            title: Center(
              child: Text(
                'Đăng ký nhận đồ'.toUpperCase(),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          body: BuildShipBody(),
        ));
  }
}

class BuildShipBody extends StatefulWidget {
  @override
  _BuildShipBodyState createState() => _BuildShipBodyState();
}

class _BuildShipBodyState extends State<BuildShipBody>
    with SingleTickerProviderStateMixin {
  TextEditingController name = TextEditingController();

  //TextEditingController value = TextEditingController();
  TextEditingController value =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');
  TextEditingController intendedTime = TextEditingController();
  TextEditingController time = TextEditingController();

  TabController? _tabController;
  bool checkedValue =false;
  ShipRegisterBloc? shipRegisterBloc ;
  Api? api;

  @override
  void initState() {
    shipRegisterBloc = BlocProvider.of<ShipRegisterBloc>(context);
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints.expand(),
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: size.width,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.black54,
              labelColor: Colors.red,
              tabs: [
                Tab(
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Tab(
                  child: Text(
                    "Đã đăng ký",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(child: _register(context)),
                  _orders(context),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _register(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
                    child: Text(
                      'Thông tin đơn hàng',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextContainer(
                    child: TextFormField(
                      controller: name,
                      cursorColor: kPrimaryColor,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Tên đơn hàng",
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: kPrimaryColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextContainer(
                    child: TextFormField(
                      controller: value,
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColor,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Giá trị đơn(VND)",
                        icon: Icon(
                          Icons.monetization_on_outlined,
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

                        intendedTime.text = DateFormat('dd-MM-yyyy').format(date);
                      },
                      controller: intendedTime,
                      cursorColor: kPrimaryColor,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelText: "Thời gian dự kiến",
                        icon: Icon(
                          Icons.timer_outlined,
                          color: kPrimaryColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  CheckboxListTile(
                    title: Text("Đăng ký giao lên tận phòng",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Visibility(
                    child: TextContainer(
                      child: TextFormField(
                        controller: time,
                        cursorColor: kPrimaryColor,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: "Thời gian giao lên phòng",
                          icon: Icon(
                            Icons.access_time,
                            color: kPrimaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    visible: checkedValue,
                  ),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton(
                child: Text(
                  "ĐĂNG KÝ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  return shipRegisterBloc!.add(ShipRegisterButtonPressed(name.text , value.text, intendedTime.text, checkedValue, time.text));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orders(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
                    child: Text(
                      'Thông tin đơn hàng',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tên đơn',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Tên đơn',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Divider(
                              color: Color(0xB9AA9595),
                              height:15,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Giá trị đơn',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Divider(
                              color: Color(0xB9AA9595),
                              height:15,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Trạng thái',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 10),
          //   width: size.width * 0.8,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(20),
          //     child: ElevatedButton(
          //       child: Text(
          //         "XÁC NHẬN",
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.bold),
          //       ),
          //       onPressed: () {},
          //       style: ElevatedButton.styleFrom(
          //           primary: Colors.redAccent,
          //           padding:
          //               EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          //           textStyle: TextStyle(
          //               color: Colors.white,
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
