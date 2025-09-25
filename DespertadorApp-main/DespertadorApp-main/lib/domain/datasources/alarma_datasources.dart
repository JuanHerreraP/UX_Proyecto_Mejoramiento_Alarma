
import 'package:despertador/domain/entities/alarma.dart';

abstract class AlarmaDatasources {

  Future<List<Alarma>> allAlarms();

  Future<Alarma> alarmById( int id );

}