import 'package:e_parking/modelos/vehicle.model.dart';
import 'package:e_parking/pages/registroAplicacion.dart';
import 'package:e_parking/peticiones/vehicle.peticion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_parking/pages/text_box.dart';

import 'inicioSesion.dart';
import 'mapaPage.dart';

class RegistroVehiulo extends StatelessWidget {
  static final String routeName = 'registro_vehiculo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CrearRegistroVehiculo(),
    );
  }
}

class CrearRegistroVehiculo extends StatefulWidget {
  _CrearRegistroVehiculoState createState() => _CrearRegistroVehiculoState();

}

class _CrearRegistroVehiculoState extends State<CrearRegistroVehiculo>{
  late TextEditingController controllerPlate;
  late TextEditingController controllerModel;
  late TextEditingController controllerBrand;
  late TextEditingController controllerType;
  var _imageFile = null;

  bool showPassword = false;


  @override
  void initState() {
    controllerPlate = new TextEditingController();
    controllerModel = new TextEditingController();
    controllerBrand = new TextEditingController();
    controllerType = new TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Registrar Vehiculo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InicioSesion()));
          },),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 2, top: 0, right: 2),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 0,
              ),
              TextBox(controllerPlate,"Placa"),
              TextBox(controllerModel, "año"),
              TextBox(controllerBrand,"marca"),
              TextBox(controllerType,"tipo"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InicioSesion()));
                    },
                    child: Text("Cancelar",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.deepPurple)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      String plate = controllerPlate.text;
                      String model = controllerModel.text;
                      String brand = controllerBrand.text;
                      String type = controllerType.text;

                      if (plate.isNotEmpty &&
                          model.isNotEmpty &&
                          brand.isNotEmpty &&
                          type.isNotEmpty) {
                        Vehicle v =
                        new Vehicle(plate: plate, model: model, brand: brand, type: type);

                        addVehicle(v).then((vehicle) {
                          if (vehicle.plate != '') {
                            print('Vehiculo registrado...!');
                            Navigator.of(context).pushNamed(MapaPage.routeName);
                          }
                        });
                      }
                    },
                    color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Guardar",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.deepPurple),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}







