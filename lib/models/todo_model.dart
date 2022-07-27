class Todo {
  int? id;
  final String title;
  final String description;
  DateTime creationDate;
  DateTime dueDate;
  bool isChecked;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.dueDate,
    required this.isChecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'creationDate': creationDate.toString(),
      'dueDate': dueDate.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Todo(id:$id, title:$title, description:$description, $creationDate , $dueDate,isChecked: $isChecked)';
  }
}
