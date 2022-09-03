import 'package:flutter/material.dart';
import 'package:imagepick/Firstpage.dart';

class Spalsescreen extends StatefulWidget {
  const Spalsescreen({Key? key}) : super(key: key);

  @override
  State<Spalsescreen> createState() => _SpalsescreenState();
}

class _SpalsescreenState extends State<Spalsescreen> {
  @override
  void initState() {
    super.initState();
    abc();
  }

  abc() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Firstpage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loding...")),
    );
  }
}
