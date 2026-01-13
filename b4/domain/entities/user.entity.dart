import '../common/base.entity.dart';
import '../value_objects/age.dart';

class User extends BaseEntity {
  final String name;
  final Age age;

  const User({required super.id, required this.name, required this.age});
}
