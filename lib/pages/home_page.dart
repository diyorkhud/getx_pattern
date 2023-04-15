import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/controllers/home_controller.dart';

import '../model/post_model.dart';
import '../views/item_home_post.dart';
class HomePage extends StatefulWidget {
  static const String id = 'homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final _controller = Get.put(HomeController());

  @override
  void initState(){
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
        centerTitle: true,
      ),
      body: Obx(
          ()=> Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  Post post = _controller.items[index];
                  return itemOfPost(_controller, post);
                },
              ),
              _controller.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {Navigator.pushNamed(context, '/postPage');},
        child: const Icon(Icons.add),
      ),
    );
  }
}
