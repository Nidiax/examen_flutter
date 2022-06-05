import 'package:flutter/material.dart';

class StatusClima extends StatelessWidget {
  final int temperatura;
  final String estadoClima;
  final Widget imagen;


 const StatusClima({Key? key,
    required this.temperatura,
    required this.estadoClima,
    required this.imagen 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$temperatura°',
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
