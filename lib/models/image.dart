
class Image {
  String? publicUrlTransformed;

  Image({this.publicUrlTransformed});


  Image.fromJson(Map<String, dynamic> json) {
    publicUrlTransformed = json['publicUrlTransformed'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['publicUrlTransformed'] = publicUrlTransformed;
    return data;
  }
}