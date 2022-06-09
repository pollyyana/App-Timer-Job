import 'package:flutter/material.dart';
import 'package:job_time/app/modules/home/widgets/header_projects_menu.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:job_time/app/core/database/database.dart';
// import 'package:job_time/app/entities/project.dart';
// import 'package:job_time/app/entities/project_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text('Sair'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projeto'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
                child: Text('cheguei no fim'),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
 // body: Column(
      //   children: [
      //     Container(),
      //     ElevatedButton(
      //       onPressed: () async {},
      //       child: const Text('Cadastrar'),
      //     ),
      //   ],
      // ),
//onpressed..21
  //   final db = Modular.get<Database>();
            //   final connection = await db.openConnection();
            //   await connection.writeTxn((isar) => connection.clear());
            //   connection.writeTxn((isar) {
            //     var project = Project();
            //     project.name = 'Projeto Teste';
            //     project.status = ProjectStatus.finalizado;

            //     return connection.projects.put(project);
            //   });
            // },