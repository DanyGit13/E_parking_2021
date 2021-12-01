class Client {
  var id;
  var name;
  var surname;
  var phone;
  var email;
  var password;
  var DNI;

  Client({this.id, this.name, this.surname, this.phone, this.email, this.password, this.DNI});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        id: json['_id'],
        name: json['nombre'],
        surname: json['apellido'],
        phone: json['telefono'],
        email: json['email'],
        password: json['password'],
        DNI: json['DNI'],
    );
  }
}
