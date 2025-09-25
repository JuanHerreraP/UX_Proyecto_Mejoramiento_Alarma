
import 'package:despertador/domain/entities/alarma.dart';

abstract class AlarmaRepositories {

  Future<List<Alarma>> allAlarms();

  Future<Alarma> alarmById( int id );

}