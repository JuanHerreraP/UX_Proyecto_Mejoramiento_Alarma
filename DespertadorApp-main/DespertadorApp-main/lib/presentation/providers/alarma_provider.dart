

import 'package:despertador/domain/entities/alarma.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'alarma_provider.g.dart';

@Riverpod(keepAlive: true)
class AlarmaProvider extends _$AlarmaProvider {

  @override
  AlarmaState build() {

    return AlarmaState();
  }

  void addAlarm( Alarma alarma ) {

    var uuid = Uuid();

    final newAlarma = Alarma(
        id: uuid.v4(),
        hora: alarma.hora,
        repetir: alarma.repetir,
        etiqueta: alarma.etiqueta,
        sonido: alarma.sonido,
        posponer: alarma.posponer,
        activa: alarma.activa
    );

    final alarmas = [ newAlarma, ...?state.alarmas ];

    state = state.copyWith(
      isLoading: false,
      errorMessage: '',
      alarmas: alarmas
    );

  }

  Alarma foundAlarmById( String alarmId ) {

    final alarma = state.alarmas?.where((al) => al.id == alarmId ).toList().first;
    return alarma!;
  }

  void editAlarm( Alarma alarma ) {

    final newAlarma = Alarma(
        hora: alarma.hora,
        repetir: alarma.repetir,
        etiqueta: alarma.etiqueta,
        sonido: alarma.sonido,
        posponer: alarma.posponer,
        activa: alarma.activa
    );

    final alarmas = state.alarmas!.map((al) {
       if( al.id == alarma.id ) {
         return newAlarma;
       }
       return al;
    }).toList();

    state = state.copyWith(
      isLoading: false,
      errorMessage: '',
      alarmas: alarmas
    );

  }

}


class AlarmaState {

  final bool isLoading;
  final String errorMessage;
  final List<Alarma>? alarmas;

  AlarmaState({this.isLoading = false, this.errorMessage = '', this.alarmas});

  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Alarma>? alarmas
  }) => AlarmaState(
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage ?? this.errorMessage,
    alarmas: alarmas ?? this.alarmas,
  );

}