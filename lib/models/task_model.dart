class TaskModel {
  int? id;
  String Nombre;
  String Apellidos;
  String Direccion;
  TaskModel({
    this.id,
    required this.Nombre,
    required this.Apellidos,
    required this.Direccion,
  });

  factory TaskModel.deMapAModel(Map<String, dynamic> mapa) => TaskModel(
        id: mapa["id"],
        Nombre: mapa["Nombre"],
        Apellidos: mapa["Apellidos"],
        Direccion: mapa["Direccion"],
      );
}
