class Task {
  static const String collectionName = 'task';

  String? id;

  String? title;

  String? description;

  DateTime? dateTime;

  bool? isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  Task.fromFireStore(Map<String, dynamic> json)
      : this(

            /// from Json  to object
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            dateTime: DateTime.fromMicrosecondsSinceEpoch(json['dateTime']),
            isDone: json['isDone' as bool]);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime?.microsecondsSinceEpoch,
      'isDone': isDone
    };
  }

  /// to Json  from object
}
