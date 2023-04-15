import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../model/post_model.dart';
import '../views/item_main_post.dart';
class MainPage extends StatefulWidget {
  static const String id = 'mainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  void initState(){
    super.initState();
    Get.find<MainController>().apiPostList();
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
              itemCount: Get.find<MainController>().items.length,
              itemBuilder: (ctx, index) {
                Post post = Get.find<MainController>().items[index];
                return itemMainPost(Get.find<MainController>(), post);
              },
            ),
            Get.find<MainController>().isLoading.value
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
