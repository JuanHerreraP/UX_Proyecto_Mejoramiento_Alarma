

class Alarma {

  final String? id;
  String hora;
  List<String> repetir;
  final String etiqueta;
  String sonido;
   bool posponer;
  bool activa;

  Alarma({
    this.id,
    required this.hora,
    required this.repetir,
    required this.etiqueta,
    required this.sonido,
    required this.posponer,
    required this.activa
  });

  copyWith({
    String? id,
    String? hora,
    List<String>? repetir,
    String? etiqueta,
    String? sonido,
    bool? posponer,
    bool? activa,
  }) => Alarma(
      hora: hora ?? this.hora,
      repetir: repetir ?? this.repetir,
      etiqueta: etiqueta ?? this.etiqueta,
      sonido: sonido ?? this.sonido,
      posponer: posponer ?? this.posponer,
      activa: activa ?? this.activa
  );


}