// Riverpod mai jitna bhi business logic hota hy wo notifier
// mai likthy hyn (kia remove hoga, kia add hoga or what to do)

// Agr hmary pass Todo model ky andr kuch bhi change ho rha hy
// to Notifier UI ko btaye ga or usky according UI update ho gi

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_code/models/todo_model.dart';

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => [Todo(id: "1", title: 'Study Flutter')];

  void add(String title) {
    if (title.trim().isEmpty) return;
    final todo = Todo(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
    );
    state = [...state, todo];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(done: !todo.done) else todo,
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
