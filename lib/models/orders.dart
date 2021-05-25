import 'dart:convert';
import 'package:ecommerce/models/photo.dart';
import 'package:ecommerce/models/user.dart';


class Data {
  Data({
    this.allOrders,
  });

  List<AllOrder>? allOrders;

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
      allOrders: List<AllOrder>.from(json!["allOrders"].map((x) =>
          AllOrder.fromJson(x as Map<String, dynamic>)
              ) as Iterable<dynamic>));

  Map<String, dynamic> toJson() => {
        "allOrders": List<dynamic>.from(allOrders!.map((x) => x.toJson())),
      };
}

class AllOrder {
  AllOrder({
    this.id,
    this.charge,
    this.total,
    this.user,
    this.items,
  });

  String? id;
  String? charge;
  int? total;
  User? user;
  List<Item>? items;

  factory AllOrder.fromJson(Map<String, dynamic>? json) => AllOrder(
        id: json!["id"] as String,
        charge: json["charge"] as String,
        total: json["total"] as int,
        user: json["user"] == null
            ? null
            : User.fromJson(json["user"] as Map<String, dynamic>),
        items: List<Item>.from(
            json["items"].map((x) => Item.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "charge": charge,
        "total": total,
        "user": user == null ? null : user!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.photo,
  });

  String? id;
  String? name;
  String? description;
  dynamic price;
  int? quantity;
  Photo? photo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] as String,
        name: json["name"] as String,
        description: json["description"] as String,
        price: json["price"] ,
        quantity: json["quantity"] as int,
        photo: Photo.fromJson(json["photo"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "photo": photo!.toJson(),
      };
}
