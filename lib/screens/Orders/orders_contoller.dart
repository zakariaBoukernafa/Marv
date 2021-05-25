import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/graphql/queries.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get to => Get.find();

  Rx<Data> orders = Data().obs;
  RxList<AllOrder> allOrders = RxList();
  @override
  Future<void> onInit() async {
    super.onInit();
    await getOrders();
  }

  Future<void> getOrders() async {
    print("getting orders");
    try {
      final res =
          await GqlController.to.httpClient.post(gql: USER_ORDERS_QUERY);
      print(res.data);
      orders.value = Data.fromJson(res.data);
      allOrders.assignAll(orders.value.allOrders!.map((item) => item)) ;
    } catch (e) {
     throw(e);
    }
  }
}
