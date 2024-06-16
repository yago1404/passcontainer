class User {
  String? id;
  String? name;
  String? email;
  String? birthday;

  User({this.id, this.name, this.email, this.birthday});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['birthday'] = birthday;
    return data;
  }
}