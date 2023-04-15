import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/post_controller.dart';
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  //final _controller = Get.put(PostController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Get.find<PostController>().apiPostCreate(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post page',style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),
      body: GetBuilder<PostController>(
        init: PostController(),
        builder: (controller){
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      // #title
                      Container(
                        height: 70,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 3),
                          color: Colors.white,
                        ),
                        child: TextField(
                          maxLines: 50,
                          controller: controller.titleController,
                          style: const TextStyle(color:Colors.black,fontSize: 20),
                          decoration: const InputDecoration(
                            hintText: 'title',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20,),

                      const SizedBox(height: 10,),
                      // #content
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 3),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: controller.bodyController,
                          style: const TextStyle(color:Colors.black,fontSize: 18),
                          maxLines: 200,
                          decoration: const InputDecoration(
                            hintText: 'body',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blue, width: 5),
                        ),
                        child: MaterialButton(
                          onPressed: (){controller.apiPostCreate(context);},
                          color: Colors.blueAccent,
                          minWidth: double.infinity,
                          height: 45,
                          child: const Text("Create post",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              controller.isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
