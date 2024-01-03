class MaterialModel {
  String Teacher;
  String grade;
  String name;
  List test;
  List summaries;
  MaterialModel(
      {required this.Teacher,
      required this.grade,
      required this.name,
      required this.summaries,
      required this.test});
  static MaterialModel fromJson(Map<String, dynamic> json) => MaterialModel(
        Teacher: json["Teacher"] ?? "",
        grade: json["grade"] ?? "",
        name: json["name"] ?? "",
        test: json["test"] ?? "",
        summaries: json["summaries"] ?? "",
      );
}
