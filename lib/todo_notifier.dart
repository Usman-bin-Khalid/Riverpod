// Riverpod mai jitna bhi business logic hota hy wo notifier 
// mai likthy hyn (kia remove hoga, kia add hoga or what to do)


// Agr hmary pass Todo model ky andr kuch bhi change ho rha hy
// to Notifier UI ko btaye ga or usky according UI update ho gi


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/models/todo_model.dart';

class TodoNotifier extends Notifier<List<Todo>> {}  