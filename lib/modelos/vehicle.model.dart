class Vehicle{
  var plate;
  var model;
  var brand;
  var type;


  Vehicle({this.plate, this.model, this.brand, this.type});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      plate: json['placa'],
      model: json['modelo'],
      brand: json['marca'],
      type: json['tipo'],
    );
  }
}