class AuthItem {
  AuthenticateUserWithPassword? authenticateUserWithPassword;

  AuthItem({this.authenticateUserWithPassword});

  AuthItem.fromJson(Map<String, dynamic> json) {
    authenticateUserWithPassword = json['authenticateUserWithPassword'] != null
        ? AuthenticateUserWithPassword.fromJson(
        json['authenticateUserWithPassword'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (authenticateUserWithPassword != null) {
      data['authenticateUserWithPassword'] =
          authenticateUserWithPassword!.toJson();
    }
    return data;
  }
}

class AuthenticateUserWithPassword {
  String? sessionToken;
  Item? item;

  AuthenticateUserWithPassword({this.sessionToken, this.item});

  AuthenticateUserWithPassword.fromJson(Map<String, dynamic> json) {
    sessionToken = json['sessionToken'] as String?;
    item = json['item'] != null ? Item.fromJson(json['item'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessionToken'] = sessionToken;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class Item {
  String? id;
  String? name;
  String? email;

  Item({this.id, this.name, this.email});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    email = json['email'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}