import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pope/src/ui/response/respose.dart';
import '../api/api_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? phb;
  String? method;
  final TextEditingController _urlController = TextEditingController();
  TextEditingController _keys = TextEditingController();
  TextEditingController _values = TextEditingController();
  List<TextEditingController> _key = [];
  List<TextEditingController> _value = [];
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    phb = TabController(length: 3, vsync: this);
  }

  // Add the form field
  _addField(){
    setState(() {
      _key.add(TextEditingController());
      _value.add(TextEditingController());
    });
  }

  // Remove the form field
  _removeField() {
    if (_key.length > 1) {
      setState(() {
        _key.removeAt(_key.length - 1);
        _value.removeAt(_value.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('RESET API Client'),
        backgroundColor: Colors.indigo,
        bottom: TabBar(
          controller: phb,
          tabs: [
            Tab(
              text: 'Params',
            ),
            Tab(
              text: 'Header',
            ),
            Tab(
              text: 'Body',
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: TabBarView(
              controller: phb,
              children: [
                // for(int i = 0; i < _key.length; i++)
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      mainAxisSize:MainAxisSize.max,
                      children:[
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _keys,
                            obscureText:false,
                            textAlign:TextAlign.start,
                            maxLines:1,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xff000000),
                            ),
                            decoration:InputDecoration(
                              disabledBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                borderSide:BorderSide(
                                    color:Color(0xff000000),
                                    width:1
                                ),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                borderSide:BorderSide(
                                    color:Color(0xff000000),
                                    width:1
                                ),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                borderSide:BorderSide(
                                    color:Color(0xff000000),
                                    width:1
                                ),
                              ),
                              hintText:"Key",
                              hintStyle:TextStyle(
                                fontWeight:FontWeight.w400,
                                fontStyle:FontStyle.normal,
                                fontSize:14,
                                color:Color(0xff000000),
                              ),
                              filled:true,
                              fillColor:Color(0xfff2f2f3),
                              isDense:false,
                              contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _values,
                            obscureText:false,
                            textAlign:TextAlign.start,
                            maxLines:1,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xff000000),
                            ),
                            decoration:InputDecoration(
                              disabledBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                borderSide:BorderSide(
                                    color:Color(0xff000000),
                                    width:1
                                ),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                borderSide:BorderSide(
                                    color:Color(0xff000000),
                                    width:1
                                ),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                borderSide:BorderSide(
                                    color:Color(0xff000000),
                                    width:1
                                ),
                              ),
                              hintText:"Value",
                              hintStyle:TextStyle(
                                fontWeight:FontWeight.w400,
                                fontStyle:FontStyle.normal,
                                fontSize:14,
                                color:Color(0xff000000),
                              ),
                              filled:true,
                              fillColor:Color(0xfff2f2f3),
                              isDense:false,
                              contentPadding:EdgeInsets.fromLTRB(12, 8, 12, 8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            color: Color(0xff212435),
                            iconSize: 24,
                            onPressed: () {  },
                          ),
                        ),
                      ],
                    ),
                  ),
                const Center(
                  child: Text(
                    "Header",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Body",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              _containerButton(text: "GET", method: () {
                setState(() {
                  method = "GET";
                });
              }),
              _containerButton(text: "POST", method: () {
                setState(() {
                  method = "POST";
                });
              }),
              _containerButton(text: "PUT", method: () {
                setState(() {
                  method = "PUT";
                });
              }),
              _containerButton(text: "PATCH", method: () {
                setState(() {
                  method = "PATCH";
                });
              }),
              _containerButton(text: "DELETE", method: () {
                setState(() {
                  method = "DELETE";
                });
              }),
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
              Column(
                children: [
                  _urlTextField(context),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget _urlTextField(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: TextFormField(
          controller: _urlController,
          style: const TextStyle(
            fontSize: 24,
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hoverColor: Colors.indigo,
              labelText: 'URL',
              suffix: IconButton(
                  onPressed: () async {
                    debugPrint(_urlController.text);
                    var data;
                    // var data = await APIClient.get(_urlController.text);
                    // debugPrint("data: ${data}");
                    switch(method){
                      case 'GET':
                        data = await APIClient.get("${_urlController.text}?${_keys.text}=${_values.text}");
                        debugPrint(method);
                        break;
                      case 'POST':
                        data = await APIClient.post("${_urlController.text}?${_keys.text}=${_values.text}", "" as Map<String, String>?, "", "" as Encoding?);
                        break;
                      case 'PUT':
                        debugPrint(method);
                        break;
                      case 'PATCH':
                        debugPrint(method);
                        break;
                      default:
                        debugPrint(method);
                        break;
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ressponse(data: data),
                        ));
                  },
                  icon: Icon(Icons.send))),
        ),
      );

  InkWell _containerButton({String? text, required Function method}) {
    return InkWell(
      onTap: (){
        method();
        },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.indigo,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.indigo,
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
