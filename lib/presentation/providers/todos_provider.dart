import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:river_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              descrition: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              descrition: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              descrition: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              descrition: RandomGenerator.getRandomName(),
              completedAt: null),
        ]);

  void addTodo() {
    final newTodo = Todo(
        id: _uuid.v4(),
        descrition: RandomGenerator.getRandomName(),
        completedAt: null);
    state = [...state, newTodo];
  }

  void toggleTodo(String id) {
    state = state.map(
      (t) {
        if (t.id != id) return t;
        if (t.done) {
          return t.copyWith(completedAt: null);
        } else {
          return t.copyWith(completedAt: DateTime.now());
        }
      },
    ).toList();
  }
}
