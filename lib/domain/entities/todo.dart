class Todo {
  final String id;
  final String descrition;
  final DateTime? completedAt;

  Todo({required this.id, required this.descrition, required this.completedAt});

  Todo copyWith({
    String? id,
    String? descrition,
    DateTime? completedAt,
  }) =>
      Todo(
          id: id ?? this.id,
          descrition: descrition ?? this.descrition,
          completedAt: completedAt);

  bool get done {
    return completedAt != null;
  }
}
