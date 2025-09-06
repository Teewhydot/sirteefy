class ProjectEntity {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String githubLink;
  final List<String> images;
  final String projectUrl;
  final bool showOnHome;

  ProjectEntity({
    required this.name,
    required this.description,
    required  this.imageUrl,
    required  this.technologies,
    required  this.githubLink,
    required  this.images,
    required  this.projectUrl,
    required this.showOnHome,
  });
}
