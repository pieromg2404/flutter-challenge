import 'package:flutter/material.dart';
import 'package:flutter_challenge/screen/add_edit_user_screen.dart';
import 'package:flutter_challenge/screen/user_detail_screen.dart';
import 'package:get/get.dart';
import '../models/user.dart';
import '../controllers/user_controller.dart';

class UserTile extends StatelessWidget {
  final User user;
  final UserController userController = Get.find();

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      onTap: () {
        Get.to(() => UserDetailScreen(user: user));
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Get.to(() => AddEditUserScreen(user: user));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              userController.deleteUser(user.id);
            },
          ),
        ],
      ),
    );
  }
}
