import 'package:randomuserflutter/features/random_users/data/models/street.dart';

class StreetEntity {
  const StreetEntity({
    required this.number,
    required this.name,
  });

  factory StreetEntity.fromModel(Street model) => StreetEntity(
        number: model.number,
        name: model.name,
      );

  final int? number;
  final String? name;
}
