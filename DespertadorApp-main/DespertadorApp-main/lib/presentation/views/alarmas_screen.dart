import 'package:despertador/presentation/providers/alarma_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlarmasScreen extends ConsumerStatefulWidget {
  const AlarmasScreen({super.key});

  @override
  AlarmasScreenState createState() => AlarmasScreenState();
}

class AlarmasScreenState extends ConsumerState<AlarmasScreen> {

  @override
  Widget build(BuildContext context) {

    final alarmasState = ref.watch( alarmaProviderProvider );

    if( alarmasState.isLoading ) return Scaffold(body: Center(child: CircularProgressIndicator(),),);
    if( alarmasState.errorMessage.isNotEmpty ) return Scaffold(body: Center(child: Text(alarmasState.errorMessage),),);

    final alarmas = alarmasState.alarmas ?? [];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mis Alarmas'),
      ),

      body: alarmas.isEmpty
        ?  Center(child: Text('Sin alarmas aun'))
        : ListView.builder(

        itemCount: alarmas.length,
        itemBuilder: (BuildContext context, int index) {
          final alarma = alarmas[index];
          return GestureDetector(
            onLongPress: () {
              context.push('/edit-alarm/${alarma.id}');
            },
            child: SwitchListTile(
              title: Text(alarma.hora.toString()),
              subtitle:  alarma.repetir.isNotEmpty ? Text(alarma.repetir.join(', ')) : Text('Nunca'),
              value: alarma.activa,
              onChanged: (value) {
                setState(() {
                  alarma.activa = value;
                });
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            context.push('/add-alarm');
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
