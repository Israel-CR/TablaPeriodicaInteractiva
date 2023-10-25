class ElementoQuimico {
  final String nombre;
  final int numeroAtomico;
  final double masaAtomica;
  final int grupo;
  final int periodo;
  final String configuracionElectronica;
  final String estadoFisico;
  final String ebullicion;
  final String fusion;
  final String densidad;

  ElementoQuimico({
    required this.nombre,
    required this.numeroAtomico,
    required this.masaAtomica,
    required this.grupo,
    required this.periodo,
    required this.configuracionElectronica,
    required this.estadoFisico,
    required this.ebullicion,
    required this.fusion,
    required this.densidad,
  });
}

final elementosQuimicos = [
  ElementoQuimico(
    nombre: 'Hidrógeno',
    numeroAtomico: 1,
    masaAtomica: 1.008,
    grupo: 1,
    periodo: 1,
    configuracionElectronica: '1s¹',
    estadoFisico: 'gas',
    ebullicion: '-252 c°',
    fusion: '-259.14 c°',
    densidad: '0.0089 g/L',
  ),
];
