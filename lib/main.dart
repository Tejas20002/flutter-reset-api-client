import 'package:flutter/material.dart';
import 'package:pope/src/ui/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//
// // list to store dynamic text field widgets
//   List<DynamicWidget> listDynamic = [];
//
// // list to store data
// // entered in text fields
//   List<String> data = [];
//
// // icon for floating action button
//   Icon floatingIcon = new Icon(Icons.add);
//
// // function to add dynamic
// // text field widget to list
//   addDynamic() {
//     // if data is already present, clear
//     // it before adding more text fields
//     if (data.length != 0) {
//       floatingIcon = new Icon(Icons.add);
//       data = [];
//       listDynamic = [];
//     }
//
//     // limit number of text fields to 5
//     if (listDynamic.length >= 5) {
//       return;
//     }
//
//     // add new dynamic text field widget to list
//     listDynamic.add(new DynamicWidget());
//     setState(() {});
//   }
//
// // function to retrieve data from
// // text fields and display in a list
//   submitData() {
//     // change icon to back arrow and clear existing data
//     floatingIcon = new Icon(Icons.arrow_back);
//     data = [];
//
//     // retrieve data from each text field widget and add to data list
//     listDynamic.forEach((widget) => data.add(widget.controller.text));
//
//     setState(() {});
//     print(data.length);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // widget to display list of entered data
//     Widget result = Flexible(
//         flex: 1,
//         child:  Card(
//           child: ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (_, index) {
//               return  Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(left: 10.0),
//                       child: Text("${index + 1} : ${data[index]}"),
//                     ),
//                     Divider()
//                   ],
//                 ),
//               );
//             },
//           ),
//         ));
//
//     // widget to display dynamic text field widgets
//     Widget dynamicTextField = Expanded(
//       child:  ListView.builder(
//         itemCount: listDynamic.length,
//         itemBuilder: (_, index) => listDynamic[index],
//       ),
//     );
//
//     // widget for submitting data
//     Widget submitButton = Container(
//       child: ElevatedButton(
//         onPressed: submitData,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text('Submit Data'),
//         ),
//       ),
//     );
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Dynamic App'),
//         ),
//         body:  Container(
//           margin:  EdgeInsets.all(10.0),
//           child:  Column(
//             children: <Widget>[
//               // if data is present, display result widget, else display dynamic text field widget
//               data.length == 0 ? dynamicTextField : result,
//               // if data is present, display submit button
//               data.length == 0 ? submitButton : Container(),
//             ],
//           ),
//         ),
//         // floating action button to add dynamic text field widgets
//         floatingActionButton: FloatingActionButton(
//           onPressed: addDynamic,
//           child: floatingIcon,
//         ),
//       ),
//     );
//   }
// }

// widget for dynamic text field
// class DynamicWidget extends StatelessWidget {
//   TextEditingController _key = new TextEditingController();
//   TextEditingController _value = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context){
//     return
//       Row(
//         mainAxisAlignment:MainAxisAlignment.spaceAround,
//         crossAxisAlignment:CrossAxisAlignment.start,
//         mainAxisSize:MainAxisSize.max,
//         children:[
//
//           Expanded(
//             flex: 1,
//             child: TextField(
//               controller:TextEditingController(),
//               obscureText:false,
//               textAlign:TextAlign.start,
//               maxLines:1,
//               style:TextStyle(
//                 fontWeight:FontWeight.w400,
//                 fontStyle:FontStyle.normal,
//                 fontSize:14,
//                 color:Color(0xff000000),
//               ),
//               decoration:InputDecoration(
//                 disabledBorder:OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(4.0),
//                   borderSide:BorderSide(
//                       color:Color(0xff000000),
//                       width:1
//                   ),
//                 ),
//                 focusedBorder:OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(4.0),
//                   borderSide:BorderSide(
//                       color:Color(0xff000000),
//                       width:1
//                   ),
//                 ),
//                 enabledBorder:OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(4.0),
//                   borderSide:BorderSide(
//                       color:Color(0xff000000),
//                       width:1
//                   ),
//                 ),
//                 hintText:"Key",
//                 hintStyle:TextStyle(
//                   fontWeight:FontWeight.w400,
//                   fontStyle:FontStyle.normal,
//                   fontSize:14,
//                   color:Color(0xff000000),
//                 ),
//                 filled:true,
//                 fillColor:Color(0xfff2f2f3),
//                 isDense:false,
//                 contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: TextField(
//               controller:TextEditingController(),
//               obscureText:false,
//               textAlign:TextAlign.start,
//               maxLines:1,
//               style:TextStyle(
//                 fontWeight:FontWeight.w400,
//                 fontStyle:FontStyle.normal,
//                 fontSize:14,
//                 color:Color(0xff000000),
//               ),
//               decoration:InputDecoration(
//                 disabledBorder:OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(4.0),
//                   borderSide:BorderSide(
//                       color:Color(0xff000000),
//                       width:1
//                   ),
//                 ),
//                 focusedBorder:OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(4.0),
//                   borderSide:BorderSide(
//                       color:Color(0xff000000),
//                       width:1
//                   ),
//                 ),
//                 enabledBorder:OutlineInputBorder(
//                   borderRadius:BorderRadius.circular(4.0),
//                   borderSide:BorderSide(
//                       color:Color(0xff000000),
//                       width:1
//                   ),
//                 ),
//                 hintText:"Value",
//                 hintStyle:TextStyle(
//                   fontWeight:FontWeight.w400,
//                   fontStyle:FontStyle.normal,
//                   fontSize:14,
//                   color:Color(0xff000000),
//                 ),
//                 filled:true,
//                 fillColor:Color(0xfff2f2f3),
//                 isDense:false,
//                 contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
//               ),
//             ),
//           ),
//           Checkbox(
//             onChanged:(value) {},
//             activeColor:Color(0xff3a57e8),
//             autofocus:false,
//             checkColor:Color(0xffffffff),
//             hoverColor:Color(0x42000000),
//             splashRadius:20,
//             value:true,
//           ),
//         ],
//     );
//   }
// }