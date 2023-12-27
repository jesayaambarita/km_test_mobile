import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:km_test/Second_Screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _polindrome =
      TextEditingController(); //controller untuk textformfield polindrome
  final String expectedText = "kasur rusak"; //text yang akan di check

  void checkPolindrome(BuildContext context) {
    String inputText = _polindrome.text.toLowerCase();
    if (inputText == expectedText) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Input matches the expected polindrome!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Input not matches the expected polindrome!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 166, 222),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 161, 206, 242),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4), // Warna bayangan
                  spreadRadius: 5, // Radius penyebaran bayangan
                  blurRadius: 7, // Radius blur bayangan
                  offset: Offset(0, 3), // Offset atau posisi bayangan
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.person_add,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 47,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: TextFormField(
              decoration: InputDecoration(
                hoverColor: Colors.blue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Name",
              ),
            ),
          ),
          Container(
            height: 47,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: TextFormField(
              controller: _polindrome,
              decoration: InputDecoration(
                hoverColor: Colors.blue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Polindrome",
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              checkPolindrome(context);
            },
            child: Container(
              height: 41,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 102, 255),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Center(
                child: Text(
                  "CHECK",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    userData: {},
                  ),
                ),
              );
            },
            child: Container(
              height: 41,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 102, 255),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
