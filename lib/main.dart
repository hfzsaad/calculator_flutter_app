import 'package:calculator_flutter_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/calculator_bindings.dart';
import 'controller/calculation_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CalculateController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: CalculatorBindings(),
      title: "Calculator Flutter App",
      home: HomeScreen(),
    );
  }
}
