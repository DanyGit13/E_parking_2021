class Parking {
  var name;
  var description;
  var phone;
  var price;


  Parking({this.name, this.description, this.phone, this.price});

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      name: json['nombre'],
      description: json['descripcion'],
      phone: json['telefono'],
      price: json['precio'],
    );
  }
}