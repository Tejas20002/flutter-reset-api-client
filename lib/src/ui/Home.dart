import 'package:flutter/material.dart';
import 'package:pope/src/model/responseModel.dart';
import 'package:pope/src/ui/response/respose.dart';
import '../api/api_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? phb;
  final TextEditingController _urlController = TextEditingController();
  List<String> tabs = ['Params', 'Header', 'Body'];
  List<TextEditingController> _key = [];
  List<TextEditingController> _value = [];

  final _formKey = GlobalKey<FormState>();

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
  _removeField(i){
    setState(() {
      _key.removeAt(i);
      _value.removeAt(i);
    });
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
          tabs: tabs.map((tab) => Tab(
              text: tab,
          )).toList(),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: TabBarView(
              controller: phb,
              children: const [
                Center(
                  child: Text(
                    "Params",
                  style: TextStyle(
                    fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Header",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
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
              _containerButton(text: "GET", method: () {}),
              _containerButton(text: "POST", method: () {}),
              _containerButton(text: "PUT", method: () {}),
              _containerButton(text: "PATCH", method: () {}),
              _containerButton(text: "DELETE", method: () {}),
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
                    var data = await APIClient.get(_urlController.text);
                    debugPrint("data: ${data}");
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
      onTap: method(),
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
