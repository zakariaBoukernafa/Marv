import 'product.dart';

class Cart {
  String? id;
  int? quantity;
  Product? product;

  Cart({this.id, this.quantity, this.product});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    quantity = json['quantity'] as int?;
    product =
    json['product'] != null ? Product.fromJson(json['product'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}