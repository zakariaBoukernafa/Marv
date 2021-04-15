import 'package:ecommerce/Controllers/GqlController.dart';
import 'package:ecommerce/Models/Product.dart';
import 'package:ecommerce/graphql/Mutations.dart';
import 'package:ecommerce/graphql/Queries.dart';
import 'package:ecommerce/utils/AppState.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  final appState = Rx<AppState>(AppState.IDLE);
  final RxList<Product> products = RxList<Product>();


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getProducts() async {
    try {
      appState.value = AppState.LOADING;
      var res = await GqlController.to.httpClient
          .post(gql: ALL_PRODUCTS_QUERY);
      List<dynamic> productsList = res.data!["allProducts"];
      List<Product> products = [];
        productsList.forEach((element) {
          products.add(Product.fromJson(element));
        });
        this.products.value = products;
        print('products :${products.length}');

      appState.value = AppState.DONE;
    } catch (e) {
      print(e);
    }
  }
}
