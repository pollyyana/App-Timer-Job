import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_time/app/modules/home/controller/home_controller.dart';
import 'package:job_time/app/modules/home/widgets/header_projects_menu.dart';
import 'package:job_time/app/view_models/project_model.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar projetos').show();
        }
      },
      child: Scaffold(
        drawer: const Drawer(
          child: SafeArea(
            child: ListTile(
              title: Text('sair'),
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
              BlocSelector<HomeController, HomeState, bool>(
                  bloc: controller,
                  selector: (state) => state.status == HomeStatus.loading,
                  builder: (context, showLoading) {
                    return SliverVisibility(
                      visible: showLoading,
                      sliver: const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                          child: Center(
                              child: CircularProgressIndicator.adaptive()),
                        ),
                      ),
                    );
                  }),
              BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                bloc: controller,
                selector: (state) => state.projects,
                builder: (context, projects) {
                  return SliverList(
                      delegate: SliverChildListDelegate(
                    projects
                        .map(
                          (project) => ListTile(
                            title: Text(project.name),
                            subtitle: Text('${project.estimate}h'),
                          ),
                        )
                        .toList(),
                  ));
                },
              )
            ],
          ),
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
