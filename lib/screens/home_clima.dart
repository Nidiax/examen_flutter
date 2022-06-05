import 'dart:math';
import 'package:examen/widget/boton_paises.dart';
import 'package:examen/widget/status_clima.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeClima extends StatefulWidget {
  HomeClima({Key? key}) : super(key: key);

  @override
  State<HomeClima> createState() => HomeClimaState();
}

class HomeClimaState extends State<HomeClima> {
  double temperatura = 40;
  String estadoClima = 'Caluroso';
  double size = 150;
  Widget imagen = const Icon(CupertinoIcons.flame_fill, size: 150);
  bool lluvia = false;
  int viento = 10;
  bool celcius = false;

  void cambiarTemperatura() {
    temperatura = Random().nextDouble() * 50;
    viento = Random().nextInt(30);
    lluvia = Random().nextBool();
    setState(() {
      if (temperatura <= 10 && (lluvia || !lluvia)) {
        estadoClima = 'Nevado';
        imagen = Icon(
          Icons.ac_unit,
          color: Colors.white,
          size: size,
        );
        return;
      }
      if (temperatura >= 22 && temperatura <= 29 && lluvia == false) {
        estadoClima = 'Soleado';
        imagen = Icon(Icons.wb_sunny, color: Colors.yellow, size: size);
        return;
      }
      //rango <25
      if (temperatura >= 18 &&
          viento >= 17 &&
          viento < 25 &&
          temperatura < 30 &&
          lluvia == false) {
        estadoClima = 'Ventoso';
        imagen = Icon(CupertinoIcons.wind,
            color: Color.fromARGB(255, 63, 62, 62), size: size);
        return;
      }
      if (temperatura >= 30 && lluvia == false) {
        estadoClima = 'Caluroso';
        imagen = Icon(CupertinoIcons.flame_fill, color: Colors.red, size: size);
        return;
      }
      if (temperatura >= 18 &&
          viento >= 17 &&
          viento < 25 &&
          lluvia &&
          temperatura < 30) {
        estadoClima = 'Lluvioso';
        imagen =
            Icon(CupertinoIcons.cloud_drizzle, color: Colors.grey, size: size);
        return;
      }
      if (temperatura >= 11 && temperatura < 22 && lluvia == false) {
        estadoClima = 'Nublado';
        imagen = Icon(Icons.wb_cloudy, color: Colors.grey, size: size);
        return;
      }
      if (temperatura >= 18 && viento > 25 && lluvia && temperatura < 30) {
        estadoClima = 'Tormenta';
        imagen = Icon(CupertinoIcons.cloud_bolt_rain,
            color: Colors.grey, size: size);
        return;
      }
      if (lluvia) {
        estadoClima = 'Lluvioso';
        imagen =
            Icon(CupertinoIcons.cloud_drizzle, color: Colors.grey, size: size);
        return;
      }
    });
  }


   double convertFarenheit(double temp) {
      return (temperatura * (9 / 5)) + 32;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Color.fromARGB(162, 17, 120, 204),
        width: double.infinity,
        height: double.infinity,

        //que tendrá dentro del center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [Transform.scale(
            scale: 2,
            child: Switch.adaptive(
            activeColor: Colors.redAccent,
            value: celcius, 
            onChanged: (bool value) {
            celcius = value;
            setState(() {
              
            });
          }),
          ),StatusClima(  
          temperatura: !celcius? temperatura : convertFarenheit(temperatura),
          estadoClima: estadoClima,
          imagen: imagen,
          celcius: celcius,
        )]
        ),
      ),
      bottomNavigationBar: BotonPaises(
        cambiarTemperatura: cambiarTemperatura,
      ),
    );
  }
}
