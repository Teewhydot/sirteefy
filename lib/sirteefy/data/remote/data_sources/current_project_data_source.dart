import 'package:cloud_firestore/cloud_firestore.dart';

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
    });
    return currentProject;
  }
}
