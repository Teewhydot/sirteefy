import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/project_entity.dart';
import '../../../domain/exceptions/custom_exceptions.dart';

abstract class ProjectsDataSource {
  Future<List<ProjectEntity>> getProjects();
}


class ProjectsFireBaseDataSource implements ProjectsDataSource {
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
            images: List<String>.from(element['images']),
            imageUrl: element['image'],
          ));
        }
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException();
      });
    return projects;
  }
}
