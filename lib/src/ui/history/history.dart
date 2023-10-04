import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pope/src/ui/response/history_response.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder(
        stream: _firestore.collection('record').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var documents = snapshot.data?.docs;
          List<Widget> data = [];
          for (var document in documents!) {
            var documentData = document.data();
            data.add(
              Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                          border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24),
                          ),
                        ),
                        child: Text(
                          documentData['method'],
                          style: TextStyle(
                            color: documentData['status'] == 200 ? Colors.green : Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      title: Text(
                        documentData['url'],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.code, color: Colors.yellowAccent),
                          Text(documentData['status'].toString(),
                              style: TextStyle(color: documentData['status'] == 200 ? Colors.green : Colors.red))
                        ],
                      ),
                      trailing: IconButton(
                        color: Colors.black,
                        iconSize: 30.0,
                        onPressed: () {
                          debugPrint(documentData.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistoryResponse(data: documentData['details'], status: documentData['status'], headers: documentData['headers'], url: documentData['url'], method: documentData['method'],),
                              ),
                          );
                        },
                        icon: Icon(Icons.keyboard_arrow_right),
                      )),
                ),
              ),
            );
          }

          return ListView(
            children: data,
          );
        },
      ),
    );
  }
}
