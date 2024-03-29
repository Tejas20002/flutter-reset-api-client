import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pope/src/ui/history/history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Ressponse extends StatefulWidget {
  var data, url, method;

  Ressponse({required this.data, required this.url, required this.method});

  @override
  State<Ressponse> createState() => _RessponseState();
}

class _RessponseState extends State<Ressponse> {
  // String yourJson = '{}';
  // String? prettyString;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET API Client'),
        backgroundColor: Colors.orange,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Text(
                      'Response Status: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.data.code}', // Dynamic
                    style: TextStyle(
                      color:
                          widget.data.code == 200 ? Colors.green : Colors.red,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Text(
                      'Response Headers: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.content_copy),
                    onPressed: () {
                      // Copy text to clipboard
                      Clipboard.setData(ClipboardData(
                          text: widget.data.header));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Response Header copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  '${widget.data.header}',
                  // prettyString!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Text(
                      'Response Details: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.content_copy),
                    onPressed: () {
                      // Copy text to clipboard
                      Clipboard.setData(ClipboardData(
                          text: widget.data.body));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Response Body copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(
                  child: Text(
                    '${widget.data.body}',
                    // prettyString!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('record')
                      .add({
                        'details': widget.data.body,
                        'headers': widget.data.header,
                        'status': widget.data.code,
                        'url': widget.url,
                        'method': widget.method
                      })
                      .then((value) => print("User Added"))
                      .catchError(
                          (error) => print("Failed to add user: $error"));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History(),
                      ));
                },
                child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
