import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EstadisticasScreen extends StatelessWidget {
  const EstadisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<DateTime> myDates = [
      DateTime.now(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estadisticas'),
      ),

      body: SingleChildScrollView(
        child: Column(

          children: [

            Text('Dias de Racha', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),

            SizedBox( height: 10, ),

            Text('20', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),

            SizedBox( height: 40, ),
            Divider(),
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(),
              value: myDates,
              onValueChanged: (dates) => myDates = dates,
            ),

          ]

        ),
      ),

    );
  }
}
