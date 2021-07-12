import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_view/split_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(DateFormat('EEE, dd-MM-yyyy').format(DateTime.now()), style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),

          onPressed: () {
            // do something
          },),
        actions: <Widget>[
      IconButton(icon: Icon(
        Icons.arrow_forward_ios_sharp,
        color: Colors.black,
      ),),
      IconButton(icon: Icon(
        Icons.calendar_today_sharp,
        color: Colors.black,
      ),),
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
      body: Container(color: Colors.white,
      child: Column(children: [
        SizedBox(height: 300,),
        Flexible(
            fit: FlexFit.loose,
            child: SplitView(
          gripSize: 8,
          children: [
            Container(
              child: Center(child: Text("View4")),
              color: Colors.purple,
            ),
            Container(
              child: Center(child: Text("View5")),
              color: Colors.yellow,
            ),
          ],
          viewMode: SplitViewMode.Horizontal,
          indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
          activeIndicator: SplitIndicator(

            viewMode: SplitViewMode.Horizontal,
            isActive: true,
          ),

          controller: SplitViewController(limits: [null, WeightLimit(max: 0.7,min: 0.3)]),
          onWeightChanged: (w) {
            setState(() {
              SplitViewController(limits: [ WeightLimit(max: 0.7,min: 0.3),null]);
            });
          },
        ))
      ],),
      ),
    );
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