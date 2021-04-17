
import 'package:ecommerce/Models/image.dart';

class Photo {
  Image? image;

  Photo({this.image});

  Photo.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
