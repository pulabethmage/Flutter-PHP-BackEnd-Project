import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/adddatatomysql.dart';
import 'package:flutter_application_2/pages/listviewdata_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
            child: Text(
          'Flutter & Json Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {Get.to(() => const MyProfile())},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: double.maxFinite,
                      height: 50,
                      color: Colors.green[600],
                      child: const Center(
                        child: Text(
                          'Single Row Data From Json Api',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {Get.to(() => const MyListVew())},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: double.maxFinite,
                      height: 50,
                      color: Colors.green[600],
                      child: const Center(
                        child: Text(
                          'ListView Row Data From Json Api',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {Get.to(() => MyDataToDatabase())},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: double.maxFinite,
                      height: 50,
                      color: Colors.green[600],
                      child: const Center(
                        child: Text(
                          'Add Data To MySql',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
