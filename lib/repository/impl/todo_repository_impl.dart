import 'package:todo_app/data_source/local/todo_data_source.dart';

import '../local/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  const TodoRepositoryImpl(
     this.todoDataSource,
  );

  @override
  Future<void> addTodo(String title) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getSortedDate(int flag) {
    // TODO: implement getSortedDate
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getToggleTodo(bool completed) {
    // TODO: implement getToggleTodo
    throw UnimplementedError();
  }

  @override
  Future<void> toggleTodo(int id) {
    // TODO: implement toggleTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(int id, String title) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

  @override
  Future<void> writeLogTodo() {
    // TODO: implement writeLogTodo
    throw UnimplementedError();
  }


}