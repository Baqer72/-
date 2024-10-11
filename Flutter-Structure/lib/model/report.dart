class Report {
  final String title;
  final String description;
  final List<String> attachment;
  final String mainAttachment;
  final String id;
  final bool deleted;
  final DateTime creationDate;
  final DateTime? modifiedDate;

  Report({
    required this.title,
    required this.description,
    required this.attachment,
    required this.mainAttachment,
    required this.id,
    required this.deleted,
    required this.creationDate,
    this.modifiedDate,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      title: json['title'],
      description: json['description'],
      attachment: List<String>.from(json['attachment']),
      mainAttachment: json['mainAttachment']??"",
      id: json['id'],
      deleted: json['deleted'],
      creationDate: DateTime.parse(json['creationDate']),
      modifiedDate: json['modifiedDate'] != null
          ? DateTime.parse(json['modifiedDate'])
          : null,
    );
  }
}