import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Dashboard',
      routes: {
        '/Dashboard': (context) => Dashboard(),
        // '/VerticalSplitView': (context) => VerticalSplitView(),
      },
    ));
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           brightness: Brightness.light,
//           cardTheme: CardTheme(
//             shape: RoundedRectangleBorder(
//               side: BorderSide(color: Colors.black, width: 1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           )),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.title,
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: VerticalSplitView(
//           left: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//             ),
//             child: Center(
//                 child: FlutterLogo(
//                   size: 256,
//                 )),
//           ),
//           right: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//             ),
//             child: Center(
//                 child: FlutterLogo(
//                     textColor: Colors.red,                 size: 256,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
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
// import 'package:flutter/material.dart';
// import 'package:split_view/split_view.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SplitView(
//         gripSize: 8,
//         children: [
//           Container(
//             child: Center(child: Text("View4")),
//             color: Colors.purple,
//           ),
//           Container(
//             child: Center(child: Text("View5")),
//             color: Colors.yellow,
//           ),
//         ],
//         viewMode: SplitViewMode.Horizontal,
//         indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
//         activeIndicator: SplitIndicator(
//
//           viewMode: SplitViewMode.Horizontal,
//           isActive: true,
//         ),
//
//         controller: SplitViewController(limits: [null, WeightLimit(max: 0.7,min: 0.3)]),
//         onWeightChanged: (w) {
//           setState(() {
//             SplitViewController(limits: [ WeightLimit(max: 0.7,min: 0.3),null]);
//           });
//         },
//       ),
//     );
//   }
// }