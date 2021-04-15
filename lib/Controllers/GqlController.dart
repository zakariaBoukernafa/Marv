import 'package:ecommerce/Services/HttpClient.dart';
import 'package:get/get.dart';

class GqlController extends GetxController {
  static GqlController get to => Get.find();

  final HttpClient _httpClient = HttpClient();

  HttpClient get httpClient => _httpClient;
}
