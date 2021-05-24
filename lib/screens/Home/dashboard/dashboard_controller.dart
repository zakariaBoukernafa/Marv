import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/graphql/queries.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  final appState = Rx<AppState>(AppState.IDLE);
  final RxList products = RxList();

  Future<void> getProducts() async {
    try {
      appState.value = AppState.LOADING;
      final res =
          await GqlController.to.httpClient.post(gql: ALL_PRODUCTS_QUERY);
      final dynamic productsList = res.data!["allProducts"];
      final List<Product> products = [];
      productsList.forEach((element) {
        products.add(Product.fromJson(element as Map<String, dynamic>));
      });
      this.products.value = products;

      appState.value = AppState.DONE;
    } catch (e) {
      //todo: remove on production
      print(e);
    }
  }

  Future<Product?> getSingleProduct({required String id}) async {
    try {
      appState.value = AppState.LOADING;
      final res = await GqlController.to.httpClient
          .post(gql: SINGLE_ITEM_QUERY, variables: {"id": id});
      final dynamic productString = res.data!["Product"];
      appState.value = AppState.DONE;

      return Product.fromJson(productString as Map<String, dynamic>);
    } catch (e) {
      //todo: remove on production
      print(e);
    }
  }

  Future<List<Product>> searchProducts({required String searchTerm}) async {
    final List<Product> products = [];

    try {
      appState.value = AppState.LOADING;
      final res = await GqlController.to.httpClient.post(
        gql: SEARCH_PRODUCTS_QUERY,
        variables: {
          "searchTerm": searchTerm,
        },
      );

      final dynamic productsList = res.data!["searchTerms"];
      productsList.forEach((element) {
        products.add(Product.fromJson(element as Map<String, dynamic>));
      });
      appState.value = AppState.DONE;
      return products;
    } catch (e) {
      //todo: remove on production
      print(e);
    }
    return [];
  }
}
