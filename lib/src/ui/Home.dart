import 'package:flutter/material.dart';
import 'package:pope/src/ui/response/respose.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? phb;
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phb = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('RESET API Client'),
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
              children: const [
                Text("Params"),
                Text("Header"),
                Text("Body"),
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
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      controller: _urlController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'URL',
        suffix: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Ressponse(),));
          debugPrint(_urlController.text);
        }, icon: Icon(Icons.send))
      ),
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
        margin: EdgeInsets.all(14),
        padding: EdgeInsets.all(10),
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.indigo,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
