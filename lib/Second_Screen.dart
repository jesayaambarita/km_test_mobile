import 'package:flutter/material.dart';

import 'Third_Screen.dart';

class SecondScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const SecondScreen({super.key, required this.userData});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.userData['avatar'] ?? "No Image"),
              ),
              title: Row(
                children: [
                  Text(widget.userData['first_name'] ?? "No Name"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.userData['last_name'] ?? "No lastName"),
                ],
              ),
              subtitle: Text(widget.userData?['email'] ?? "No Email"),
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdScreen(),
                ),
              );
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 41,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.blue),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Center(
                child: Text(
                  "Choose a User",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
