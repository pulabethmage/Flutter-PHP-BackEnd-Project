import 'dart:convert';
import 'package:flutter/material.dart';
import '../classes/data_class.dart';
import 'package:http/http.dart' as http;

class MyListViewStateFull extends StatefulWidget {
  const MyListViewStateFull({super.key});

  @override
  State<MyListViewStateFull> createState() => _MyListViewStateFullState();
}

//get data from api
Future<List<Data>> fetchData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _MyListViewStateFullState extends State<MyListViewStateFull> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder<List<Data>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.deepPurple[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(snapshot.data![index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 10),
                              Text(snapshot.data![index].email),
                              const SizedBox(height: 10),
                              Text(snapshot.data![index].body),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
