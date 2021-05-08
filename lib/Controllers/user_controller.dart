import 'package:ecommerce/Models/user.dart';
import 'package:ecommerce/utils/user_state.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  final Rxn<User> _user = Rxn<User>();
  final _box = GetStorage();
  final userState = Rx<UserState>(UserState.UNDEFINED);

  @override
  Future<void> onInit() async {
    super.onInit();
    await GetStorage.init();
    loadUser();
  }

  Rxn<User>? get user => _user;

  Future<void> saveUser({required User user}) async {
    _user.value = user;
    print(user.authenticatedItem!.email);
    await _box.write("user", _user);
    UserController.to.userState.value = UserState.AUTHENTICATED;
  }

  Future<void> loadUser() async {
    final data = await _box.read("user");

    if (data != null) {
      _user.value = User.fromJson(data as Map<String, dynamic>);
      print("user value : ${_user.value}");
      userState.value = UserState.AUTHENTICATED;
    } else {
      userState.value = UserState.UNAUTHENTICATED;
    }
    //todo: remove
    print(userState.value);
  }
}
