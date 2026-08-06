import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_code/models/todo_model.dart';
import 'package:riverpod_code/todo_notifier.dart';

final todoProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new, // jb zrorat pry todo notifier ka object bna dena
);




final pendingCountProvider = Provider<int>((ref) {
  // Jitna bhi riverpod ka control hota hy wo ref ky pass hota hy
  // Kisi bhi provider sy data access krna hy to hum ref ky through kr skty hyn
  final todos = ref.watch(todoProvider);
  // watch todoProvider ko observe krta hy means kuch bhi change hota hy
  // to directly todos update ho jai ga

  // read aik hi bar changing ko catch krta hy usky bd koi bhi changing
  // hoti hy provider mai usko koi frq nhi pry ga
  return todos.where((t) => !t.done).length;
});


