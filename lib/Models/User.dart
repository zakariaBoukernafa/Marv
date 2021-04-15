import 'Cart.dart';

class User {
  AuthenticatedItem? authenticatedItem;

  User({this.authenticatedItem});

  User.fromJson(Map<String, dynamic> json) {
    authenticatedItem = json['authenticatedItem'] != null
        ? new AuthenticatedItem.fromJson(json['authenticatedItem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authenticatedItem != null) {
      data['authenticatedItem'] = this.authenticatedItem!.toJson();
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
    id = json['id'];
    name = json['name'];
    email = json['email'];
    if (json['cart'] != null) {
      cart = [];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}