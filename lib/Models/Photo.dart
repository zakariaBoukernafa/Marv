
import 'package:ecommerce/Models/Image.dart';

class Photo {
  Image? image;

  Photo({this.image});

  Photo.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}
