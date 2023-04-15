import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/update_controller.dart';

class UpdatePage extends StatefulWidget {
  String title;
  String body;
  UpdatePage({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  //final _controller = Get.put(UpdateController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.titleController.text = widget.title;
  //   controller.bodyController.text = widget.body;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update page',style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),
      body: GetBuilder<UpdateController>(
        init: UpdateController(),
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
                          border: Border.all(color: Colors.green, width: 3),
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
                          border: Border.all(color: Colors.green, width: 3),
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
                          border: Border.all(color: Colors.teal, width: 5),
                        ),
                        child: MaterialButton(
                          onPressed: (){controller.apiPostUpdate(context);},
                          color: Colors.green,
                          minWidth: double.infinity,
                          height: 45,
                          child: const Text("Update post",style: TextStyle(color: Colors.white,fontSize: 18),),
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
