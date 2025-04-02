abstract interface class TodoRepository {
  Future<List<Map<String, dynamic>>> getTodos();
  Future<void> addTodo(String title);
  Future<void> updateTodo(int id, String title);
  Future<void> toggleTodo(int id);
  Future<void> deleteTodo(int id);
  Future<List<Map<String, dynamic>>> getSortedDate(int flag);
  Future<List<Map<String, dynamic>>> getToggleTodo(bool completed);
  Future<void> writeLogTodo();

}