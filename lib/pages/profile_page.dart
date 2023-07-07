import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String message = "";
  int pageno = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Fetch Single Row Data",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() => pageno++),
                  getData(),
                },
                child: Column(
                  children: [
                    Text('Title No $pageno'),
                    const SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 50,
                        color: Colors.green[600],
                        child: const Center(
                            child: Text(
                          "Click to Change the Title Number",
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getData() async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/albums/$pageno'); // Url of the website where we get the data from.
    var request = http.Request('GET', url); // Set to GET
    http.StreamedResponse response = await request.send(); // Send request.
    // Check if response is okay
    if (response.statusCode == 200) {
      dynamic data =
          await response.stream.bytesToString(); // Turn bytes to readable data.
      var json = jsonDecode(data);
      setState(() => message = json["title"]);
    } else {
      print("${response.statusCode} - Something went wrong..");
    }
  }
}
