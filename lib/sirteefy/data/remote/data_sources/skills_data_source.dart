
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sirteefy/sirteefy/data/remote/models/skill_model.dart';
import 'package:sirteefy/utils/other/misc.dart';

import '../../../domain/exceptions/custom_exceptions.dart';

abstract class SkillsDataSource {
  Future<SkillModel> getSkills();
}


class SkillsFireBaseDataSource implements SkillsDataSource {
  final fireStore = FirebaseFirestore.instance;

  @override
  Future<SkillModel> getSkills()async {
      Map<String, dynamic> skills = {};
      return await fireStore.collection('Skills').doc('skills').get().then((value) {
        skills = value.data()!;
        return SkillModel.fromJson(skills);
      }).timeout(apiTImeOut, onTimeout: () {
        throw TimeoutException();
      });
  }

}
