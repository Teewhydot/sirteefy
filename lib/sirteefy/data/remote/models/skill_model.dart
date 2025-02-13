import 'package:sirteefy/sirteefy/domain/entities/skill_entity.dart';

class SkillModel extends Skill {
  SkillModel({
required super.tools,
required super.frameworks,
required super.languages,
});
  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      tools: List<String>.from(json['tools']),
      frameworks: List<String>.from(json['frameworks']),
      languages: List<String>.from(json['languages']),
    );
  }
}
