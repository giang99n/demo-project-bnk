import 'dart:ui';

import 'package:demo_manager/blocs/bill/bill_bloc.dart';
import 'package:demo_manager/configs/colors.dart';
import 'package:demo_manager/configs/constants.dart';
import 'package:demo_manager/models/bill_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BillBloc>(
              create: (_) => BillBloc()..add(BillEventStated())),
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
                'Hóa đơn'.toUpperCase(),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          body: BuildBillBody(),
        ));
  }
}

class BuildBillBody extends StatefulWidget {
  @override
  _BuildBillBodyState createState() => _BuildBillBodyState();
}

class _BuildBillBodyState extends State<BuildBillBody>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints.expand(),
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
                    "Chưa thanh toán",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Tab(
                  child: Text(
                    "Đã thanh toán",
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
                  _billUnpaid(context),
                  _billPaid(context),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _billUnpaid(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      margin: const EdgeInsets.only(top: 10),
      child: BlocBuilder<BillBloc, BillState>(builder: (context, state) {
        if (state is BillLoadingState) {
          return Container(
              alignment: Alignment.topCenter,
              height: size.height * 0.18,
              child: const CircularProgressIndicator());
        } else if (state is BillLoadedState) {
          List<Result>? billUnpaid = state.bill.result!
              .where((item) => item.isPaid == false)
              .toList();
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: size.height* 0.7,
                  child: ListView.builder(
                    itemBuilder: (BuildContext buildContext, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Card(
                          child: ListTile(
                            title: Text(billUnpaid[index].time.toString()),
                            subtitle: Text("Tổng:" + billUnpaid[index].total.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            leading: Icon(Icons.list_alt_rounded),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ),
                      );
                    },
                    itemCount: billUnpaid.length,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                      child: Text(
                        "THANH TOÁN",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: TextStyle(
                              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ],
            ),

          );

        } else {
          return Container();
        }
      }),
    );
  }

  Widget _billPaid(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BillResponse billResponse;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: BlocBuilder<BillBloc, BillState>(builder: (context, state) {
        if (state is BillLoadingState) {
          return Container(
              alignment: Alignment.topCenter,
              height: size.height * 0.18,
              child: const CircularProgressIndicator());
        } else if (state is BillLoadedState) {
          billResponse = state.bill;
          List<Result>? billPaid = billResponse.result!
              .where((item) => item.isPaid == true)
              .toList();

          void showDialog(int index) {
            showGeneralDialog(
              barrierLabel: "Barrier",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: Duration(milliseconds: 500),
              context: context,
              pageBuilder: (_, __, ___) {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height * 0.5,
                    margin: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Thời gian: " + billPaid[index].time.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Tiền điện: " +
                                        billPaid[index]
                                            .electricityBill
                                            .toString(),
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    "Tiền nước: " +
                                        billPaid[index]
                                            .electricityBill
                                            .toString(),
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    "Tiền dịch vụ: " +
                                        billPaid[index].service.toString(),
                                    style: TextStyle(fontSize: 16)),
                              ],
                            )),
                        Text(
                          "Tổng: " + billPaid[index].total.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                );
              },
              transitionBuilder: (_, anim, __, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                      .animate(anim),
                  child: child,
                );
              },
            );
          }

          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemBuilder: (BuildContext buildContext, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(index);
                      },
                      title: Text(billPaid[index].time.toString()),
                      subtitle: Text("Tổng:" + billPaid[index].total.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      leading: Icon(Icons.list_alt_rounded),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                );
              },
              itemCount: billPaid.length,
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
