import 'package:randomuserflutter/features/random_users/data/models/user.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/location_entity.dart';
import 'package:randomuserflutter/features/random_users/domain/entities/name_entity.dart';

class UserEntity {
  const UserEntity({
    required this.gender,
    required this.email,
    required this.location,
    required this.phone,
    required this.image,
    required this.name,
    required this.nat,
  });

  factory UserEntity.fromModel(User model) => UserEntity(
        gender: model.gender,
        email: model.email,
        location: LocationEntity.fromModel(model.location!),
        phone: model.phone,
        image: model.picture!.thumbnail,
        name: NameEntity.fromModel(model.name!),
        nat: model.nat,
      );

  final String gender;
  final NameEntity? name;
  final LocationEntity? location;
  final String? email;
  final String? phone;
  final String? image;
  final String nat;
}
