import 'package:flutter/material.dart';
import 'package:flutter_challenge/widgets/user_title.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import 'add_edit_user_screen.dart';


class UserListScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => AddEditUserScreen());
            },
          )
        ],
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              return UserTile(user: userController.users[index]);
            },
          );
        }
      }),
    );
  }
}
