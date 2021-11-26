import 'package:demo_pj/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(userController.storeModel.name),
      ),
      body: Column(
        children: [
          Text(userController.storeModel.phone),
          Text(userController.storeModel.name),
        ],
      ),
    );
  }
}
