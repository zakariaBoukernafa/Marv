import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/graphql/queries.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get to => Get.find();
  final appState = Rx<AppState>(AppState.IDLE);

  Rx<Data> orders = Data().obs;
  RxList<AllOrder> allOrders = RxList();
  @override
  Future<void> onInit() async {
    super.onInit();
    await getOrders();
  }

  Future<void> getOrders() async {
    try {
      appState.value = AppState.LOADING;
      final res =
          await GqlController.to.httpClient.post(gql: USER_ORDERS_QUERY);
      orders.value = Data.fromJson(res.data);
      allOrders.assignAll(orders.value.allOrders!.map((item) => item)) ;
      appState.value = AppState.DONE;

    } catch (e) {
      appState.value = AppState.ERROR;
    }
  }
}
