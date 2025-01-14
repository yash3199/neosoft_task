import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_task/presentation/controllers/addressInfo/address_info_controller.dart';
import 'package:neosoft_task/presentation/controllers/basicInfo/basic_info_controller.dart';
import 'package:neosoft_task/presentation/controllers/completeInfo/complete_info_controller.dart';
import 'package:neosoft_task/src/core/routes/routes.dart';


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
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.basicInfoPage,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}


