import 'package:flutter/material.dart';

class StatusClima extends StatelessWidget {
  final double temperatura;
  final String estadoClima;
  final Widget imagen;
  final bool celcius;


 const StatusClima({Key? key,
    required this.temperatura,
    required this.estadoClima,
    required this.imagen, 
    required this.celcius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${temperatura.toStringAsFixed(2)}°${!celcius ? 'C' : 'F'}',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
         imagen,
          Text(
            estadoClima,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
