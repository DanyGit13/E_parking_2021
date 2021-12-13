class Vehicle{

  var plate;
  var model;
  var brand;
  var type;


  Vehicle({this.plate, this.model, this.brand, this.type});

  factory Vehicle.fromJson(Map<String, dynamic> parsedjson) {
    return Vehicle(

      plate: parsedjson['placa'],
      model: parsedjson['modelo'],
      brand: parsedjson['marca'],
      type: parsedjson['tipo'],
    );
  }
}