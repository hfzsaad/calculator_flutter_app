import 'package:get/instance_manager.dart';
import '../controller/calculation_controller.dart';

class CalculatorBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateController());
  }
}
