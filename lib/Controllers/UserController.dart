import 'package:ecommerce/Models/User.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();


  final Rxn<User>? _user = Rxn<User>();
  final _box = GetStorage();


  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Rxn<User>? get user => _user;

  Future<void> saveUser() async {
    _box.write("user", user);
  }

  Future<void> loadUser() async {
    var data = _box.read("user");
    if(data != null){
      this._user!.value = _box.read("user");
    }
  }
}
