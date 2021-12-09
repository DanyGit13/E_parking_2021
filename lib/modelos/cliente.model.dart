class User {
  var name;
  var email;
  var password;


  User({this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['nombre'],
        email: json['email'],
        password: json['password'],

    );
  }
}
