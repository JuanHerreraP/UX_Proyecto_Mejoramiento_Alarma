import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AjustesScreen extends StatelessWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajustes'),
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [

            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text('Cuenta'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => context.push('/cuenta'),
            ),

            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notificaciones'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => context.push('/notificaciones'),
            ),

            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Calendario'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => context.push('/calendario'),
            ),

            ListTile(
              leading: Icon(Icons.color_lens_sharp),
              title: Text('Aparencia'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => context.push('/apariencia'),
            ),

            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Acerca de'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => context.push('/acerca-de'),
            ),

          ],
        ),
      ),

    );
  }
}
