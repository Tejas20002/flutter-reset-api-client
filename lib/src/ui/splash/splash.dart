import 'package:flutter/material.dart';
import 'package:pope/src/ui/Home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(), ), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          "RESET API CLIENT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'Robots',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
