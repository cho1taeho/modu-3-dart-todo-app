import 'dart:convert';
import 'dart:math';

import 'package:todo_app/data_source/local/todo_data_source.dart';

import '../../model/todo.dart';
import '../local/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  const TodoRepositoryImpl(
     this.todoDataSource,
  );

  @override
  Future<List<Todo>> getTodos() async {
    final jsonList = await todoDataSource.readTodos();
    return jsonList.map((e)=>Todo.fromJson(e)).toList();
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
      createdAt: DateTime.now()
    );
    todos.add(newTodo);
    await todoDataSource.writeTodos(todos.map((e) => e.toJson()).toList());
    //로그 처리
  }

  @override
  Future<void> updateTodo(int id, String title) async{
    final todos = await getTodos();
    final index = todos.indexWhere((e) => e.id == id);
    final updateTitleTodo = todos[index].copyWith(title: title);
    todos[index] = updateTitleTodo;
    await todoDataSource.writeTodos(todos.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> getToggleTodo(int id) async {
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
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getSortedDate(int flag) {
    // TODO: implement getSortedDate
    throw UnimplementedError();
  }




  @override
  Future<void> toggleTodo(int id) {
    // TODO: implement toggleTodo
    throw UnimplementedError();
  }



  @override
  Future<void> writeLogTodo() {
    // TODO: implement writeLogTodo
    throw UnimplementedError();
  }

  indexWhere(bool Function(dynamic e) param0) {}


}