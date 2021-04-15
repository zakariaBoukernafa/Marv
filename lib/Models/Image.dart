
class Image {
  String? publicUrlTransformed;

  Image({this.publicUrlTransformed});

  Image.fromJson(Map<String, dynamic> json) {
    publicUrlTransformed = json['publicUrlTransformed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicUrlTransformed'] = this.publicUrlTransformed;
    return data;
  }
}