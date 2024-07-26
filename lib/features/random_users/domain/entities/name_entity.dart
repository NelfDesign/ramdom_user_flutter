import 'package:randomuserflutter/features/random_users/data/models/name.dart';

class NameEntity {
  const NameEntity({
    required this.last,
    required this.first,
  });

  factory NameEntity.fromModel(Name model) => NameEntity(
        last: model.last,
        first: model.first,
      );

  final String? first;
  final String? last;
}
