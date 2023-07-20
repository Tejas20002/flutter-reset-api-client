import 'dart:convert';

import 'package:flutter/material.dart';

class Ressponse extends StatefulWidget {
  const Ressponse({super.key});

  @override
  State<Ressponse> createState() => _RessponseState();
}

class _RessponseState extends State<Ressponse> {
  String yourJson = '{"bet_histories":[{"point":5,"bet_type":"Close","jodi_digit":"00"},{"point":5,"bet_type":"Close","jodi_digit":"99"},{"point":5,"bet_type":"Close","jodi_digit":"88"},{"point":5,"bet_type":"Close","jodi_digit":"77"},{"point":5,"bet_type":"Close","jodi_digit":"66"}]}';
  String? prettyString;
  @override
  void initState() {
    super.initState();
    final object = json.decode(yourJson);
    prettyString = JsonEncoder.withIndent('  ').convert(object);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET API Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Response Status: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '200', // Dynamic
                    style: TextStyle(
                      color: Color(0xFF31D023),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                'Response Details: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text(prettyString!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
