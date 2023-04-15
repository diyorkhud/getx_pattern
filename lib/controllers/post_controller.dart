import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';
class PostController extends GetxController{
  var items = [];
  var isLoading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  void apiPostCreate(BuildContext context)async {
    isLoading = true;
    update();
    Post post = Post(title: titleController.text, body: bodyController.text, userId: 3);

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }
    isLoading = false;
    update();
    print(response);
  }
}