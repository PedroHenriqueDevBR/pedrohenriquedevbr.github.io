class ExperienceModel {
  String companyName;
  String description;
  String start;
  String? end;

  ExperienceModel({
    required this.companyName,
    required this.description,
    required this.start,
    this.end,
  });
}
