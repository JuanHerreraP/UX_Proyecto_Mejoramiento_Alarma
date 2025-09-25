
import 'package:despertador/domain/entities/alarma.dart';
import 'package:despertador/presentation/providers/alarma_provider.dart';
import 'package:despertador/presentation/widgets/shared/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multi_dropdown.dart';


final sonidos = [
  DropdownItem(label: 'Por defecto', value: 'defecto'),
  DropdownItem(label: 'Melodia Suave', value: 'melodiasuave'),
  DropdownItem(label: 'Rock', value: 'rock'),
];

class AddAlarmScreen extends ConsumerStatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  AddAlarmScreenState createState() => AddAlarmScreenState();
}

class AddAlarmScreenState extends ConsumerState<AddAlarmScreen> {

  final sonidoController = MultiSelectController<String>();
  final etiquetaController = TextEditingController();

  final formater = DateFormat('hh:mm a');

  DateTime hora = DateTime.now();
  List<String> repetir = [];
  String? sonido;
  bool posponer = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Anadir Alarma'),
      ),

      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TimePickerSpinner(
                is24HourMode: false,
                normalTextStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black26
                ),
                highlightedTextStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                ),
                spacing: 50,
                itemHeight: 80,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    hora = time;
                  });
                },
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align( alignment: Alignment.centerLeft, child: Text('Repetir'), ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SegmentedButton(
                    direction: Axis.horizontal,

                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(7)
                            )
                        )
                    ),

                    segments: [
                      ButtonSegment(value: 'lunes', label: Text('lu') ),
                      ButtonSegment(value: 'martes', label: Text('ma') ),
                      ButtonSegment(value: 'miercoles', label: Text('mie') ),
                      ButtonSegment(value: 'jueves', label: Text('Ju') ),
                      ButtonSegment(value: 'viernes', label: Text('Vie') ),
                    ],

                    showSelectedIcon: false,
                    multiSelectionEnabled: true,
                    emptySelectionAllowed: true,
                    selected: repetir.toSet(),
                    onSelectionChanged: ( dias ) {
                      setState(() {
                        repetir = dias.toList();
                      });
                    },
                  )
                ],
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align( alignment: Alignment.centerLeft, child: Text('Etiqueta'), ),
              ),
              SizedBox(height: 20,),

              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: etiquetaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Etiqueta'),
                    suffixIcon: Icon(Icons.energy_savings_leaf_outlined),
                  ),
                  validator: (value) {
                    if( value == null || value.isEmpty ) {
                      return 'Ingrese alguna categoria';
                    }
                    if( value.length < 3 ) {
                      return 'Ingrese una categoria valida';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align( alignment: Alignment.centerLeft, child: Text('Sonido'), ),
              ),


              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomDropDown(
                  hintText: 'Sonido',
                  items: sonidos,
                  controller: sonidoController,
                  callback: (value) {
                    setState(() {
                      sonido = value;
                      print(sonido);
                    });
                  },),
              ),


              SizedBox(height: 40,),

              SizedBox(
                width: 200,
                child: SwitchListTile(
                  title: Text('Posponer'),
                  value: posponer,
                  onChanged: (value) {
                    setState(() {
                      posponer = value;
                      print(posponer);
                    });
                  },
                ),
              ),

              Spacer(),

              Row(
                children: [

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                          onPressed: () { context.pop(); },
                          child: Text('Cancelar')
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                          onPressed: () {

                            final alarma = Alarma(
                                hora: formater.format(hora),
                                repetir: repetir,
                                etiqueta: etiquetaController.text,
                                sonido: sonidoController.toString(),
                                posponer: posponer,
                                activa: false
                            );

                            if( formKey.currentState!.validate() ) {
                              ref.read( alarmaProviderProvider.notifier ).addAlarm(alarma);

                              context.pop();

                            }
                          },
                          child: Text('Guardar')
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
      ),
    );
  }
}
