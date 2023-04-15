import 'package:get/get.dart';
import 'package:getx_pattern/controllers/main_controller.dart';
import 'package:getx_pattern/controllers/post_controller.dart';
import 'package:getx_pattern/controllers/starter_controller.dart';
import 'package:getx_pattern/controllers/update_controller.dart';

import '../controllers/splash_controller.dart';
class DIService{
  static Future<void> init()async{
    //Get.put<MainController>(MainController());
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);
    Get.lazyPut<PostController>(() => PostController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
  }
}