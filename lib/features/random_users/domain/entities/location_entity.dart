import 'package:randomuserflutter/features/random_users/data/models/location.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/street_entity.dart';

class LocationEntity {
  const LocationEntity({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory LocationEntity.fromModel(Location model) => LocationEntity(
        street: StreetEntity.fromModel(model.street!),
        city: model.city,
        state: model.state,
        country: model.country,
        postcode: model.postcode,
      );

  final StreetEntity? street;
  final String? city;
  final String? state;
  final String? country;
  final int? postcode;
}
