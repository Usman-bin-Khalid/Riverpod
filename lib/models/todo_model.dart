class Todo {
  final String id;
  final String title;
  final bool done;

  Todo({required this.id, required this.title, this.done = false});
  Todo copyWith({String? title, bool? done}) {
    return Todo(id: id, title: title ?? this.title, done: done ?? this.done);
  }
}


// Riverpod ka rule -> Variable ki state humehsa Immutable(can not change) hoti hy

