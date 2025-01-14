import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_task/src/core/routes/routes.dart';
import 'src/core/di/di.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
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


