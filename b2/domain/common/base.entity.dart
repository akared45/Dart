abstract class BaseEntity {
  final int? id;
  BaseEntity({this.id});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BaseEntity &&
            runtimeType == other.runtimeType &&
            id != null &&
            id == other.id);
  }

  @override
  int get hashCode => id.hashCode;
}
