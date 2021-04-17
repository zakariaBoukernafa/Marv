import 'cart.dart';

class User {
  AuthenticatedItem? authenticatedItem;

  User({this.authenticatedItem});

  User.fromJson(Map<String, dynamic> json) {
    authenticatedItem = json['authenticatedItem'] != null
        ? AuthenticatedItem.fromJson(json['authenticatedItem'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (authenticatedItem != null) {
      data['authenticatedItem'] = authenticatedItem!.toJson();
    }
    return data;
  }
}

class AuthenticatedItem {
  String? id;
  String? name;
  String? email;
  List<Cart>? cart;

  AuthenticatedItem({this.id, this.name, this.email, this.cart});

  AuthenticatedItem.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    email = json['email'] as String? ;
    if (json['cart'] != null) {
      cart = [];
      json['cart'].forEach((v) {
        cart!.add(Cart.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}