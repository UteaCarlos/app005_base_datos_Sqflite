import 'package:app05_basedatos/db/db_admin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  Future <String> getFullName() async{
    return "Juan Mauel";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: FutureBuilder(
        future: DBAdmin.db.getTasks(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if (snap.hasData){
            List
          }
          print(snap.data);
          return Text("Hola");
        },
        //child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
            //ElevatedButton(
             // onPressed: () {

               // DBAdmin.db.updateTask();
             // },
             // child: Text("Mostrar data"),
            //),
           // ElevatedButton(
             // onPressed: () {

               // DBAdmin.db.insertTask();

             // },
             // child: Text("Insertar Tarea"),
            //),

           // ElevatedButton(
             // onPressed: () {

              //  DBAdmin.db.updateTask();
             // },
             // child: Text("Actualizar Tarea"),
            //),

           // ElevatedButton(
             // onPressed: () {

               // DBAdmin.db.deleteTask();
             // },
             // child: Text("Eliminar Tarea"),
            //),
          //],
        //),
      ),
    );
  }
}
