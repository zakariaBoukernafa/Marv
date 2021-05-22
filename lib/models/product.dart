
import 'photo.dart';

class Product {
  String? id;
  int? price;
  String? name;
  String? description;
  Photo? photo;

  Product({this.id, this.price, this.name, this.description, this.photo});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    price = json['price'] as int?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    photo = json['photo'] != null ? Photo.fromJson(json['photo'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['name'] = name;
    data['description'] = description;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    return data;
  }

}