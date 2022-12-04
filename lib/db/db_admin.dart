import 'dart:io';

import 'package:app05_basedatos/models/task_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> chekDatabase() async {
    if (myDatabase != null) {
      return myDatabase;
    }

    myDatabase = await initDatabase();
    return myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Cliente_BD.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database dbx, int version) async {
        //CREAR LA TABLA DATOS CLIENTE
        await dbx.execute(
            "CREATE TABLE Cliente(id INTEGER PRIMARY KEY AUTOINCREMENT, Nombre TEXT,Apellidos TEXT, Direccion TEXT, Telefono TEXT,Correo TEXT)");
      },
    );
  }

  // INSERTAR DATOS A LA TABLA CLIENTE inserRawtTask
  Future<int> insertRawTask(TaskModel model) async {
    Database? db = await chekDatabase();
    int res = await db!.rawInsert(
        "INSERT INTO Cliente(Nombre, Apellidos, Direccion,Telefono,Correo)VALUES ('${model.Nombre}','${model.Apellidos}','${model.Direccion}')");
    return res;
  }

  // INSERTAR DATOS A LA TABLA CLIENTE insertTask

  Future<int> insertTask(TaskModel model) async {
    Database? db = await chekDatabase();
    int res = await db!.insert(
      "Cliente",
      {
        "Nombre": model.Nombre,
        "Apellidos": model.Apellidos,
        "Direccion": model.Direccion,
      },
    );
    return res;
  }

  getRawTasks() async {
    Database? db = await chekDatabase();
    List tasks = await db!.rawQuery("SELECT * FROM Cliente");
    print(tasks);
  }

  Future<List<TaskModel>> getTasks() async {
    Database? db = await chekDatabase();
    List<Map<String, dynamic>> tasks = await db!.query("Cliente");
    List<TaskModel> taskModelList =
        tasks.map((e) => TaskModel.deMapAModel(e)).toList();

// tasks.forEach((element) {
//   TaskModel task = TaskModel.deMapAModel(element);
//   taskModelList.add(task);
// });
    // print(taskModelList);

    return taskModelList;
  }

  //PARA ACTUALIZAR DATOS
  updateRawTask() async {
    Database? db = await chekDatabase();
    int res = await db!.rawUpdate(
        "UPDATE Cliente SET Nombre = 'Jorge', Apellidos = 'Ramos', Direccion = 'Av. Sol', Telefono = '123456789', Correo = 'Jorge@gmail.com' WHERE id =2");
    print(res);
  }

//PARA ACTUALIZAR DATOS MAS DIRECTOS
  updateTask() async {
    Database? db = await chekDatabase();
    int res = await db!.update(
        "Cliente",
        {
          "Nombre": "Juan Carlos",
          "Apellidos": "Flores",
          "Direccion": "Wanchaq",
          "Telefono": "987456321",
          "Correo": "juancarlos@gmail.com",
        },
        where: "id = 2");
  }

//PARA ELIMINAR UN REGISTRO
  deleteRawTask() async {
    Database? db = await chekDatabase();
    int res = await db!.rawDelete("DELETE FROM Cliente WHERE id = 2");
    print(res);
  }

  Future<int> deleteTask(int id) async {
    Database? db = await chekDatabase();
    int res = await db!.delete("Cliente", where: "id = $id");
    return res;
  }

  deleteTASK(int taskId) {}
}
