import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/exceptions/custom_exceptions.dart';

abstract class CurrentProjectDataSource {
  Future<String> getCurrentProject();
}

class CurrentProjectFireBaseDataSource implements CurrentProjectDataSource {
  @override
  Future<String> getCurrentProject() async {
    String currentProject = '';
      final fireStore = FirebaseFirestore.instance;
      await fireStore
          .collection('CurrentProject')
          .doc('current_project')
          .get()
          .then((value) {
        currentProject = value['name'];
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException();
      });
      return currentProject;

  }
}
