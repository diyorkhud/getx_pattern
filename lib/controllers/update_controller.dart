import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';
class UpdateController extends GetxController{
  var isLoading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void apiPostUpdate(BuildContext context) async {
    isLoading = true;
    update();

    Post post = Post(
      id: 1,
      title: titleController.text,
      body: bodyController.text,
      userId: 2,
    );

    var response = await Network.PUT('${Network.API_UPDATE}1', Network.paramsUpdate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }
    isLoading = false;
    update();
    print(response);
  }
}