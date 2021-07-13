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
  // final _dateFormatter = DateFormat('EEE, dd-MM-yyyy').format(DateTime.now());
  //
  //
  // DateTime changeDate(DateTime dtObj, int numberOfDays) {
  //   return dtObj.add(Duration(days: numberOfDays));
  // }
  // String formattedDate = _dateFormatter.format(changeDate);


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
            // do something
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // do something
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
              child: Container(
                decoration: BoxDecoration(
                    // border: Border(
                    //     bottom: BorderSide(
                    //         color: Color.fromRGBO(0, 0, 0, 1.0),
                    //         width: 1.0
                    //     )            )
                    ),
              ),
              flex: 1,
            ),
            Expanded(
                flex: 3,
                child: SplitView(
                  gripColorActive: Colors.black,
                  gripColor: Colors.transparent,
                  gripSize: 8,
                  children: [
                    Container(
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
                    Container(
                      child: LayoutBuilder(
                        builder: (context, constraints){
                          var parentHeight = constraints.maxHeight;
                          var parentWidth = constraints.maxWidth;
                          debugPrint('Max height: $parentHeight, max width: $parentWidth');
                          return parentWidth >69.0?
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
                ))
          ],
        ),
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
