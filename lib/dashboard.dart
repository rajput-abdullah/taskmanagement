import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_view/split_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime startDateSelected;
  final startDateController = TextEditingController();
  int sDay;
  int sMonth;
  int sYear;
  bool val =false;
  bool dialogBoxVal =false;
  bool dialogBoxVal2 =false;
  final DateFormat month = DateFormat("MM");
  final DateFormat day = DateFormat("dd");
  final DateFormat year = DateFormat("yyyy");
  List list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];

  DateTime changeDate(DateTime dtObj, int numberOfDays) {
    return dtObj.add(Duration(days: numberOfDays));
  }


  double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * 0.65;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          startDateController.text.isNotEmpty? startDateController.text:DateFormat('EEE, dd-MM-yyyy').format(DateTime.now()),
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            startDateController.text = DateFormat('EEE, dd-MM-yyyy').format(changeDate(startDateSelected,-1));
            setState(() {
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              startDateController.text = DateFormat('EEE, dd-MM-yyyy').format(changeDate(startDateSelected,1));
              setState(() {
              });
            },
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              startDate(context);
            },
            icon: Icon(
              Icons.calendar_today_sharp,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child:  ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),

                            child: Align(alignment: Alignment.centerLeft,child: Text(
                              "Create a google ads compaign ",textAlign: TextAlign.center,
                            ),),
                            // margin: EdgeInsets.only(top: 3),
                            height: 35,
                          ),
                          Checkbox(value: val,focusColor: Colors.grey, checkColor: Colors.black, onChanged: (bool newValue) {
                            setState(() {
                              val = newValue;
                            });
                          },)
                        ],
                      ),);
                  }),
              flex: 1,
            ),
            Expanded(
                flex: 3,
                child: SplitView(
                  gripColorActive: Colors.black,
                  gripColor: Colors.transparent,
                  gripSize: 15,
                  children: [
                    GestureDetector(
                      onTap: () => showDetail(),

                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return new Container(
                                        // margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            list[index].toString(),
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ));
                                    }),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return new Container(
                                        height: 21,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom:
                                            BorderSide(color: Colors.black),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.black),
                                  ),
                                ),
                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: list.length,
                                    itemBuilder: (BuildContext ctxt, int index) {
                                      return new Container(
                                        height: 21,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom:
                                            BorderSide(color: Colors.black),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: LayoutBuilder(
                        builder: (context, constraints){
                          var parentHeight = constraints.maxHeight;
                          var parentWidth = constraints.maxWidth;
                          debugPrint('Max height: $parentHeight, max width: $parentWidth');
                          return parentWidth >100?
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: list.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return  Container(
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  child: Align(alignment: Alignment.centerLeft,child: Text(
                                    "Create a google ads compaign ",textAlign: TextAlign.center,
                                  ),),
                                  // margin: EdgeInsets.only(top: 3),
                                  height: 35,
                                );
                              }):
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: list.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return  Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(color: Colors.black),
                                  //   ),
                                  // ),
                                  child: Align(alignment: Alignment.center,child:
                                  Icon(Icons.circle, color: Colors.grey, size: 12,),

                                  ),
                                  // margin: EdgeInsets.only(top: 3),
                                  height: 35,
                                );
                              });

                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ),
                  ],
                  viewMode: SplitViewMode.Horizontal,
                  indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
                  activeIndicator: SplitIndicator(
                    viewMode: SplitViewMode.Horizontal,
                    isActive: true,
                  ),
                  controller: SplitViewController(
                      limits: [null, WeightLimit(max: 0.8, min: 0.2)]),
                  onWeightChanged: (w) {
                    setState(() {
                      SplitViewController(
                          limits: [WeightLimit(max: 0.8, min: 0.2), null]);
                    });
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {addTask();},

        child: Icon(Icons.add, size: 38,),

        backgroundColor: Colors.grey,
      ),

    );
  }
  startDate(BuildContext context) async {
    DateTime startSelectedDate = await showDatePicker(
        context: context,
        initialDate:
        startDateSelected != null ? startDateSelected : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.grey,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (startSelectedDate != null) {
      startDateSelected = startSelectedDate;
      sYear = int.parse(year.format(startDateSelected));
      sMonth = int.parse(month.format(startDateSelected));
      sDay = int.parse(day.format(startDateSelected));
      startDateController
        ..text =DateFormat('EEE, dd-MM-yyyy').format(startDateSelected)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: startDateController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {
      });

    }
  }
  Future addTask() async{
    await showDialog(
        context: context,
        builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: Wrap(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "What is the task?", style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:                   IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.clear, color: Colors.grey[700], size: 22  ,))
                    ,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15,bottom: 15, top: 3),
                child: TextField(

                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Text("Add to ${"Super-Tasks"}?", style: TextStyle(
                          color: Colors.grey[700], fontSize: 18
                      ),),
                    ),
                    Text("You have 3 positions left", style: TextStyle(
                        color: Colors.grey, fontSize: 13
                    ),),
                  ],),
                  Column(children: [
                    Checkbox(value: dialogBoxVal,focusColor: Colors.grey, checkColor: Colors.black,
                      onChanged: (value) {
                        dialogBoxVal = value;
                        dialogBoxVal2 = true;
                        setState(() {

                          print(value);
                        });
                      },)


                  ],),
                ],
              ),
              Align(alignment: Alignment.bottomCenter, child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Set Time Box", style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),)
            ])));
  }
  Future showDetail() async{
    await showDialog(
        context: context,
        builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: Wrap(children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Set Time Box" , style: TextStyle(
                      color: Colors.grey, fontSize: 18
                  ),),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Task:" , style: TextStyle(
                      color: Colors.grey, fontSize: 12
                  ),),
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                  ),

                ),
                child: Text("Task Name Here" , style: TextStyle(
                    color: Colors.grey[300], fontSize: 18
                ),),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                width: double.maxFinite,
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1,)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return new Container(
                                // margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    list[index].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ));
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return new Container(
                                height: 23,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                    BorderSide(color: Colors.black),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return new Container(
                                height: 23,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                    BorderSide(color: Colors.black),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Align(alignment: Alignment.bottomRight, child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  margin: EdgeInsets.only(right: 15, bottom: 15, top: 5),
                  child: Text(
                    "Done", style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),),
              )

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(left: 15, top: 10),
              //       child: Text(
              //         "What is the task?", style: TextStyle(color: Colors.grey, fontSize: 18),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.topRight,
              //       child:                   IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.clear, color: Colors.grey[700], size: 22  ,))
              //       ,
              //     )
              //   ],
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 15, right: 15,bottom: 15, top: 3),
              //   child: TextField(
              //
              //       keyboardType: TextInputType.text,
              //       maxLines: 3,
              //       style: TextStyle(color: Colors.black),
              //       decoration: InputDecoration(
              //
              //         enabledBorder: OutlineInputBorder(
              //           borderSide:
              //           BorderSide(color: Colors.black),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide:
              //           BorderSide(color: Colors.black),
              //         ),
              //         border: OutlineInputBorder(
              //           borderSide:
              //           BorderSide(color: Colors.black),
              //         ),
              //       )),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              //   children: [
              //     Column(children: [
              //       Container(
              //         margin: EdgeInsets.only(left: 18),
              //         child: Text("Add to ${"Super-Tasks"}?", style: TextStyle(
              //           color: Colors.grey[700], fontSize: 18
              //         ),),
              //       ),
              //       Text("You have 3 positions left", style: TextStyle(
              //         color: Colors.grey, fontSize: 13
              //       ),),
              //     ],),
              //     Column(children: [
              //       Checkbox(value: dialogBoxVal,focusColor: Colors.grey, checkColor: Colors.black,
              //         onChanged: (value) {
              //           dialogBoxVal = value;
              //           dialogBoxVal2 = true;
              //         setState(() {
              //
              //           print(value);
              //         });
              //       },)
              //
              //
              //     ],),
              //   ],
              // ),
              // Align(alignment: Alignment.bottomCenter, child: Container(
              //   decoration: BoxDecoration(
              //       color: Colors.grey[800],
              //       borderRadius: BorderRadius.all(Radius.circular(5.0))
              //   ),
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   margin: EdgeInsets.symmetric(vertical: 15),
              //   child: Text(
              //     "Set Time Box", style: TextStyle(color: Colors.white, fontSize: 18),
              //   ),
              // ),)
            ])));
  }

}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class VerticalSplitView extends StatefulWidget {
//   final Widget left;
//   final Widget right;
//   final double ratio;
//
//   const VerticalSplitView(
//       {Key key, @required this.left, @required this.right, this.ratio = 0.5})
//       : assert(left != null),
//         assert(right != null),
//         assert(ratio >= 0),
//         assert(ratio <= 1),
//         super(key: key);
//
//   @override
//   _VerticalSplitViewState createState() => _VerticalSplitViewState();
// }
//
// class _VerticalSplitViewState extends State<VerticalSplitView> {
//   final _dividerWidth = 16.0;
//
//   //from 0-1
//   double _ratio;
//   double _maxWidth;
//
//   get _width1 => _ratio * _maxWidth;
//
//   get _width2 => (1 - _ratio) * _maxWidth;
//
//   @override
//   void initState() {
//     super.initState();
//     _ratio = widget.ratio;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, BoxConstraints constraints) {
//       assert(_ratio <= 1);
//       assert(_ratio >= 0);
//       if (_maxWidth == null) _maxWidth = constraints.maxWidth - _dividerWidth;
//       if (_maxWidth != constraints.maxWidth) {
//         _maxWidth = constraints.maxWidth - _dividerWidth;
//       }
//
//       return SizedBox(
//         width: constraints.maxWidth,
//         child: Row(
//           children: <Widget>[
//             SizedBox(
//               width: _width1,
//               child: widget.left,
//             ),
//             GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               child: SizedBox(
//                 width: _dividerWidth,
//                 height: constraints.maxHeight,
//                 child: RotationTransition(
//                   child: Icon(Icons.drag_handle),
//                   turns: AlwaysStoppedAnimation(0.25),
//                 ),
//               ),
//               onPanUpdate: (DragUpdateDetails details) {
//                 setState(() {
//                   _ratio += details.delta.dx / _maxWidth;
//                   if (_ratio > 1)
//                     _ratio = 1;
//                   else if (_ratio < 0.0) _ratio = 0.0;
//                 });
//               },
//             ),
//             SizedBox(
//               width: _width2,
//               child: widget.right,
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
