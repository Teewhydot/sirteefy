class ProjectEntity {
  final String name;
  final String description;
  final String? imageUrl;
  final List<String>? technologies;
  final String? githubLink;
  final List<String>? images;
  final String? projectUrl;

  ProjectEntity({
    required this.name,
    required this.description,
    this.imageUrl,
    this.technologies,
    this.githubLink,
    this.images,
    this.projectUrl,
  });
}
