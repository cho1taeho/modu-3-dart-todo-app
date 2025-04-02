import 'package:todo_app/data_source/local/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> readTodos() {
    // TODO: implement readTodos
    throw UnimplementedError();
  }

  @override
  Future<void> writeTodos(List<Map<String, dynamic>> todos) {
    // TODO: implement writeTodos
    throw UnimplementedError();
  }
  
  
}