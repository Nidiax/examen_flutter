import 'package:flutter/material.dart';

class BotonPaises extends StatelessWidget {
  final Function cambiarTemperatura;
  ButtonStyle style = TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: const Color.fromARGB(255, 211, 208, 208),
              textStyle: const TextStyle(
                fontSize: 16.5,
                fontStyle: FontStyle.normal
              ),
            );

  BotonPaises({Key? key, required this.cambiarTemperatura})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fila de botones
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () => cambiarTemperatura(),
            style:style,
            child: const Text('MEX'), 
          ),
          TextButton(
            onPressed: () => cambiarTemperatura(),
            style:style,
            child: const Text('ESP'),
          ),
          TextButton(
            onPressed: () => cambiarTemperatura(),
            style : style,
            child: const Text('KOR'),
          ),
          TextButton(
            onPressed: () => cambiarTemperatura(),
            style:style,
            child: const Text('CHN'),
          ),
          TextButton(
            onPressed: () => cambiarTemperatura(),
            style: style,
            child: const Text('JNP'),
          ),
        ]
        //boton de paises
        );
  }
}
