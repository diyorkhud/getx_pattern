import 'package:get/get.dart';
import 'package:getx_pattern/controllers/main_controller.dart';
class BindService implements Bindings{
  
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}