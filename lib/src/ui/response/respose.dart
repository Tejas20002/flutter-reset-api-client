import 'package:flutter/material.dart';

class Ressponse extends StatefulWidget {
  var data;
  Ressponse({required this.data});
  @override
  State<Ressponse> createState() => _RessponseState();
}

class _RessponseState extends State<Ressponse> {
  // String yourJson = '{}';
  // String? prettyString;
  @override
  void initState() {
    super.initState();
    // final object = json.decode(yourJson);
    // prettyString = JsonEncoder.withIndent('  ').convert(object);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET API Client'),
        backgroundColor: Colors.indigo,
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
                      color: widget.data.code == 200 ? Colors.green : Colors.red,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
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
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                  '${widget.data.header}',
                  // prettyString!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
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
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                    '${widget.data.body}',
                    // prettyString!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
