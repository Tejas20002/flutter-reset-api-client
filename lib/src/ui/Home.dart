import 'package:flutter/material.dart';
import 'package:pope/src/ui/history/history.dart';
import 'package:pope/src/ui/response/respose.dart';
import '../api/api_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController phb;
  String? method;
  final TextEditingController _urlController = TextEditingController();
  TextEditingController _keys = TextEditingController();
  TextEditingController _values = TextEditingController();
  List<TextEditingController> _key = [];
  List<TextEditingController> _value = [];

  // New Code
  List<List<TextEditingController>> _controllersList = [];
  @override
  void initState() {
    super.initState();
    phb = TabController(length: 3, vsync: this);

    // Initialize controllers
    for (int i = 0; i < 3; i++) {
      _controllersList
          .add(List.generate(1, (index) => TextEditingController()));
    }
  }

  // New Code
  @override
  void dispose() {
    phb.dispose();

    // Dispose controllers
    for (var controllers in _controllersList) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('RESET API Client'),
        backgroundColor: Colors.orange,
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
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("History"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => History(),
                  ));
            }
          }),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: TabBarView(
              controller: phb,
              children: [
                // for(int i = 0; i < _key.length; i++)
                buildTab(0, 'Params'),
                buildTab(1, 'Header'),
                buildTab(2, 'Body'),
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
              _containerButton(
                  text: "GET",
                  method: () {
                    setState(() {
                      method = "GET";
                      debugPrint(method);
                    });
                  }),
              _containerButton(
                  text: "POST",
                  method: () {
                    setState(() {
                      method = "POST";
                      debugPrint(method);
                    });
                  }),
              _containerButton(
                  text: "PUT",
                  method: () {
                    setState(() {
                      method = "PUT";
                      debugPrint(method);
                    });
                  }),
              _containerButton(
                  text: "PATCH",
                  method: () {
                    setState(() {
                      method = "PATCH";
                      debugPrint(method);
                    });
                  }),
              _containerButton(
                  text: "DELETE",
                  method: () {
                    setState(() {
                      method = "DELETE";
                    });
                    debugPrint(method);
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
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TextFormField(
          controller: _urlController,
          style: const TextStyle(
            fontSize: 24,
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hoverColor: Colors.orange,
              labelText: 'URL',
              suffix: IconButton(
                  onPressed: () async {
                    var data;
                    String urlWithParams =
                        _urlController.text + '?${_keys.text}=${_values.text}';

                    for (int i = 1; i < _key.length; i++) {
                      String key = _key[i].text.trim();
                      String value = _value[i].text.trim();
                      urlWithParams +=
                          (_key.length == 0 ? '&' : '?') + '$key=$value';
                      debugPrint("$_key");
                    }
                    debugPrint(urlWithParams);
                    switch (method) {
                      case 'GET':
                        data = await APIClient.get("${urlWithParams}");
                        debugPrint(method);
                        break;
                      case 'POST':
                        data = await APIClient.post(
                            "${_urlController.text}?${_keys.text}=${_values.text}",
                            null,
                            null,
                            null);
                        break;
                      case 'PUT':
                        data = await APIClient.put(
                            "${_urlController.text}?${_keys.text}=${_values.text}",
                            null,
                            null,
                            null);
                        debugPrint(method);
                        break;
                      case 'PATCH':
                        data = await APIClient.patch(
                            "${_urlController.text}?${_keys.text}=${_values.text}",
                            null,
                            null,
                            null);
                        debugPrint(method);
                        break;
                      default:
                        data = await APIClient.delete(
                            "${_urlController.text}?${_keys.text}=${_values.text}",
                            null,
                            null,
                            null);
                        debugPrint(method);
                        break;
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ressponse(
                              data: data,
                              url: _urlController.text,
                              method: method),
                        ));
                  },
                  icon: Icon(Icons.send))),
        ),
      );

  InkWell _containerButton({String? text, required Function method}) {
    return InkWell(
      onTap: () {
        method();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(
          text!,
          style: const TextStyle(
              color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // New Code
  Widget buildTab(int tabIndex, String tabName) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _controllersList[tabIndex].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _keys,
                          obscureText: false,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Color(0xff000000), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Color(0xff000000), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Color(0xff000000), width: 1),
                            ),
                            hintText: "Key",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            filled: true,
                            fillColor: Color(0xfff2f2f3),
                            isDense: false,
                            contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _values,
                          obscureText: false,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Color(0xff000000), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Color(0xff000000), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                  color: Color(0xff000000), width: 1),
                            ),
                            hintText: "Value",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            filled: true,
                            fillColor: Color(0xfff2f2f3),
                            isDense: false,
                            contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          color: Color(0xff212435),
                          iconSize: 24,
                          onPressed: () {
                            setState(() {
                              _controllersList[tabIndex].removeAt(index);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add a new text field
              setState(() {
                _controllersList[tabIndex].add(TextEditingController());
              });
            },
            child: Text('Add ${tabName}'),
          ),
        ],
      ),
    );
  }
}
// stateFull, provider, fobx, getx, getit, bloc, rivercode, hooks