import 'dart:convert';
import 'dart:math';

import 'package:todo_app/data_source/local/todo_data_source.dart';
import 'package:collection/collection.dart';
import '../../model/todo.dart';
import '../local/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  const TodoRepositoryImpl(this.todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final jsonList = await todoDataSource.readTodos();
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<void> addTodo(String title) async {
    final todos = await getTodos();
    final newId = todos.isEmpty ? 1 : todos.map((e) => e.id).reduce(max) + 1;

    final newTodo = Todo(
      userId: 1,
      id: newId,
      title: title,
      completed: false,
      createdAt: DateTime.now(),
    );
    todos.add(newTodo);
    await todoDataSource.writeTodos(todos.map((e) => e.toJson()).toList());
    //로그 처리
  }

  @override
  Future<void> updateTodo(int id, String title) async {
    final todos = await getTodos();
    final index = todos.indexWhere((e) => e.id == id);
    final updateTitleTodo = todos[index].copyWith(title: title);
    todos[index] = updateTitleTodo;
    await todoDataSource.writeTodos(todos.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> toggleTodo(int id) async {
    final todos = await getTodos();
    final index = todos.indexWhere((e) => e.id == id);

    if (todos[index].completed == true) {
      final updateTitleTodo = todos[index].copyWith(completed: false);
      todos[index] = updateTitleTodo;
    } else {
      final updateTitleTodo = todos[index].copyWith(completed: true);
      todos[index] = updateTitleTodo;
    }

    await todoDataSource.writeTodos(todos.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> deleteTodo(int id) async {
    final todos = await getTodos();
    todos.removeWhere((e) => e.id == id);

    await todoDataSource.writeTodos(todos.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<Todo>> getSortedDate(int choice) async {
    final todos = await getTodos();

    if (choice == 1) {
      final sortedTodos = todos.sorted(
        (a, b) => b.createdAt.compareTo(a.createdAt),
      );
      return sortedTodos;
    } else if(choice == 2) {
      final sortedTodos = todos.sorted(
        (a, b) => a.createdAt.compareTo(b.createdAt),
      );
      return sortedTodos;
    }else{
      return todos;
    }

  }

  @override
  Future<List<Todo>> getToggleTodo(int choice) async {
    final todos = await getTodos();

    if (choice == 1) {
      final completedTodos = todos.where((e) => e.completed == true).toList();
      return completedTodos;
    } else if (choice == 2) {
      final completedTodos = todos.where((e) => e.completed == false).toList();
      return completedTodos;
    } else {
      return todos;
    }
  }

  Future<List<int>> getTodosIdList() async {
    final todos = await getTodos();

    final todosIdList = todos.map((e) => e.id).toList();

    return todosIdList;
  }


  @override
  Future<void> writeLogTodo() async {
    final todos = await getTodos();



  }

}
