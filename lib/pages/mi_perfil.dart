import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mi_perfil extends StatelessWidget {
  static final String routeName = 'mi_perfil';


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/Perfil_imagen.png'),
              ),
              Positioned(
                right: -10,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.blueAccent)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Icon(Icons.add_a_photo),

                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
