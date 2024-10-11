class StudyMaterial {
  final String dayOfWeek;
  final String materialName;
  final String doctorName;
  final String studyHall;
  final String color;
  final String description;
  final String progress;
  final int state;
  final int numberToOrder;
  final String id;
  final bool deleted;
  final DateTime creationDate;

  StudyMaterial({
    required this.dayOfWeek,
    required this.materialName,
    required this.doctorName,
    required this.studyHall,
    required this.color,
    required this.description,
    required this.progress,
    required this.state,
    required this.numberToOrder,
    required this.id,
    required this.deleted,
    required this.creationDate,
  });

  factory StudyMaterial.fromJson(Map<String, dynamic> json) => StudyMaterial(
        dayOfWeek: json["dayOfWeek"],
        materialName: json["materialName"],
        doctorName: json["doctorName"],
        studyHall: json["studyHall"],
        color: json["color"],
        description: json["description"],
        progress: json["progress"],
        state: json["state"],
        numberToOrder: json["numberToOrder"],
        id: json["id"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creationDate"]),
      );
}
