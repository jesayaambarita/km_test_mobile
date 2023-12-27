import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:km_test/Second_Screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  Future<List<dynamic>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      // Jika permintaan berhasil, parse data dari JSON ke list
      Map<String, dynamic> data = json.decode(response.body);
      return data['data'];
    } else {
      // Jika permintaan gagal, lempar exception atau kembalikan data kosong
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Third Screen",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    snapshot.data[index]['avatar'],
                  ),
                ),
                title: Row(
                  children: [
                    Text(snapshot.data[index]['first_name']),
                    SizedBox(
                      width: 5,
                    ),
                    Text(snapshot.data[index]['last_name']),
                  ],
                ),
                subtitle: Text(snapshot.data[index]['email']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        userData: snapshot.data![index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
