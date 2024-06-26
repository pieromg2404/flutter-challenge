import 'package:get/get.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  final UserService userService = UserService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var userList = await userService.getUsers();
      users.assignAll(userList);
        } finally {
      isLoading(false);
    }
  }

  void addUser(User user) async {
    try {
      await userService.addUser(user);
      fetchUsers();
    } catch (e) {
      Get.snackbar('Error', 'Could not add user');
    }
  }

  void editUser(int id, User user) async {
    try {
      await userService.editUser(id, user);
      fetchUsers();
    } catch (e) {
      Get.snackbar('Error', 'Could not edit user');
    }
  }

  void deleteUser(int id) async {
    try {
      await userService.deleteUser(id);
      fetchUsers();
    } catch (e) {
      Get.snackbar('Error', 'Could not delete user');
    }
  }
}
