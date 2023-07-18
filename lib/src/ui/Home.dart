import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? phb;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    phb = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET API Client'),
      ),
      body: Column(
        children: [
          TabBar(
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
          TabBarView(
            children: [
              Text("Params"),
              Text("Header"),
              Text("Body"),
            ],
            controller: phb,
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
                  TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Url',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

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
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
