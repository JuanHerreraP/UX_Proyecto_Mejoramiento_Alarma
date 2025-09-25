

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Acerca de'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 30,),
            Text('Acerca de', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 20,),

            Text('Alarma Activa es una aplicación de alarmas interactivas diseñada para ayudarte a despertar de forma efectiva y evitar quedarte dormido nuevamente.'),
            SizedBox(height: 20,),

            Text('Informacion de la Aplicacion', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 20,),

            Text('Nombre: Alarma Activa'),
            Text('Veersion Actual: 10.1'),
            Text('Desarrollador: Alarma Activa'),
            SizedBox(height: 20,),

            Text('Licencias y Creditos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 20,),

            Text('Este software se distribuye bajo licencia MIT.'),
            Text('Algunos iconos y recursos gráficos provienen de la librería Flaticon.'),


          ],
        ),
      ),
    );
  }
}
