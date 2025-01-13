import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_task/address_controller.dart';
import 'package:neosoft_task/education_controller.dart';
import 'package:neosoft_task/register_controller.dart';

import 'basic_info.dart';
void main() {
  Get.put(RegistrationController());
  Get.put(EducationController());
  Get.put(AddressController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BasicInfoPage(),
    );
  }
}


