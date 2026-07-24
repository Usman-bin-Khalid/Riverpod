import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_code/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final pending = ref.watch(pendingCountProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Todo Provider")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "$pending kam baqi hy",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: todos.isEmpty
                ? const Center(
                    child: Text("Abhi koi todo nhi hy nechy + dobaou"),
                  )
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.done,
                          onChanged: (_) {
                            ref.read(todoProvider.notifier).toggle(todo.id);
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.done
                                ? TextDecoration.lineThrough
                                : null,
                            color: todo.done ? Colors.grey : null,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            ref.read(todoProvider.notifier).remove(todo.id);
                          },
                          icon: const Icon(Icons.delete_outline),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Todo"),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'What want to do'),
          // Key board ky zrye add krna onSubmitted
          onSubmitted: (_) {
            ref.read(todoProvider.notifier).add(controller.text.toString());
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(todoProvider.notifier).add(controller.text);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
