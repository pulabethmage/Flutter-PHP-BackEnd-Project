import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/listviewstatefull.dart';

class MyListVew extends StatelessWidget {
  const MyListVew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch List of Data | ListView'),
        ),
        body: const MyListViewStateFull());
  }
}
