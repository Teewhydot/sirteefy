import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/project_entity.dart';

abstract class ProjectDataSource {
  Future<List<ProjectEntity>> getProjects();
}


class ProjectsFireBaseDataSource implements ProjectDataSource {
  final fireStore = FirebaseFirestore.instance;


  @override
  Future<List<ProjectEntity>> getProjects() async {
    List<ProjectEntity> projects = [];
    await fireStore.collection('Projects').get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        projects.add(ProjectEntity(
          name: element['name'],
          description: element['description'],
          projectUrl: element['web'],
          githubLink: element['github'],
          technologies: List<String>.from(element['technologies']),
        ));
      }
    });
    return projects;
  }
}
