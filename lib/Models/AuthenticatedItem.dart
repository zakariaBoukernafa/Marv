class AuthItem {
  AuthenticateUserWithPassword? authenticateUserWithPassword;

  AuthItem({this.authenticateUserWithPassword});

  AuthItem.fromJson(Map<String, dynamic> json) {
    authenticateUserWithPassword = json['authenticateUserWithPassword'] != null
        ? new AuthenticateUserWithPassword.fromJson(
        json['authenticateUserWithPassword'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authenticateUserWithPassword != null) {
      data['authenticateUserWithPassword'] =
          this.authenticateUserWithPassword!.toJson();
    }
    return data;
  }
}

class AuthenticateUserWithPassword {
  String? sessionToken;
  Item? item;

  AuthenticateUserWithPassword({this.sessionToken, this.item});

  AuthenticateUserWithPassword.fromJson(Map<String, dynamic> json) {
    sessionToken = json['sessionToken'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionToken'] = this.sessionToken;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
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
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}