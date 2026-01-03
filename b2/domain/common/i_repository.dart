abstract class IRepository<T, ID> {
  Future<void> add(T entity);
  Future<void> update(T entity);
  Future<void> delete(ID id);
  Future<T?> getById(ID id);
  Future<List<T>> getAll();
}