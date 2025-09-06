import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sirteefy/utils/other/misc.dart';

import '../../../domain/entities/project_entity.dart';
import '../../../domain/exceptions/custom_exceptions.dart';

abstract class ProjectsDataSource {
  Future<List<ProjectEntity>> getProjects();
  Future<List<ProjectEntity>> getHomeProjects();
}

class ProjectsFireBaseDataSource implements ProjectsDataSource {
  late final fireStore = FirebaseFirestore.instance;

  String _sanitizeImageUrl(dynamic imageData) {
    if (imageData == null) return '';

    final str = imageData.toString().trim();

    // Handle common problematic cases
    if (str.isEmpty ||
        str == 'null' ||
        str == 'undefined' ||
        str == '""' ||
        str == "''" ||
        str.startsWith('%22') || // URL encoded quotes
        str.endsWith('%22')) {
      return '';
    }

    // Remove surrounding quotes if present
    String cleaned = str;
    if ((cleaned.startsWith('"') && cleaned.endsWith('"')) ||
        (cleaned.startsWith("'") && cleaned.endsWith("'"))) {
      cleaned = cleaned.substring(1, cleaned.length - 1);
    }

    // URL decode if needed
    try {
      cleaned = Uri.decodeFull(cleaned);
    } catch (e) {
      // If decode fails, use original
    }

    return cleaned.trim();
  }

  @override
  Future<List<ProjectEntity>> getProjects() async {
    List<ProjectEntity> projects = [];
    try {
      await fireStore.collection('Projects').get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          try {
            // Debug logging
            final imageData = element['image'];

            final sanitizedImageUrl = _sanitizeImageUrl(imageData);

            projects.add(ProjectEntity(
              name: element['name'] ?? '',
              description: element['description'] ?? '',
              projectUrl: element['web'] ?? '',
              githubLink: element['github'] ?? '',
              technologies: List<String>.from(element['technologies'] ?? []),
              images: List<String>.from(element['images'] ?? []),
              imageUrl: sanitizedImageUrl,
              showOnHome: element['showOnHome'] ?? false,
            ));
          } catch (e) {
            // Skip this document and continue
            continue;
          }
        }
      }).timeout(apiTImeOut, onTimeout: () {
        throw TimeoutException();
      });
    } catch (e) {
      throw Exception('Failed to fetch projects: $e');
    }
    return projects;
  }

  @override
  Future<List<ProjectEntity>> getHomeProjects() async {
    List<ProjectEntity> projects = [];
    try {
      await fireStore
          .collection('Projects')
          .where('showOnHome', isEqualTo: true)
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          try {
            // Debug logging
            final imageData = element['image'];

            final sanitizedImageUrl = _sanitizeImageUrl(imageData);

            projects.add(ProjectEntity(
              name: element['name'] ?? '',
              description: element['description'] ?? '',
              projectUrl: element['web'] ?? '',
              githubLink: element['github'] ?? '',
              technologies: List<String>.from(element['technologies'] ?? []),
              images: List<String>.from(element['images'] ?? []),
              imageUrl: sanitizedImageUrl,
              showOnHome: element['showOnHome'] ?? false,
            ));
          } catch (e) {
            // Skip this document and continue
            continue;
          }
        }
      }).timeout(apiTImeOut, onTimeout: () {
        throw TimeoutException();
      });
    } catch (e) {
      throw Exception('Failed to fetch home projects: $e');
    }
    return projects;
  }
}
