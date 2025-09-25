


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {

  bool notificaciones = false;
  bool pastillas = false;
  bool reuniones = false;
  bool alarmas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notificaciones'),
      ),

      body: Column(
        children: [

          SizedBox(height: 30,),

          SwitchListTile(
            title: Text('Notificaciones Web'),
            value: notificaciones,
            onChanged: (value){
              setState(() {
                notificaciones = value;
              });
            },
          ),

          SwitchListTile(
            title: Text('Recordar Pastillas'),
            value: pastillas,
            onChanged: (value){
              setState(() {
                pastillas = value;
              });
            },
          ),

          SwitchListTile(
            title: Text('Recordar Reuniones'),
            value: reuniones,
            onChanged: (value){
              setState(() {
                reuniones = value;
              });
            },
          ),

          SwitchListTile(
            title: Text('Recordar Alarmas'),
            value: alarmas,
            onChanged: (value){
              setState(() {
                alarmas = value;
              });
            },
          ),

        ],
      ),
    );
  }
}
