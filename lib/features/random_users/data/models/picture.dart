import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture {
  const Picture({
    required this.thumbnail,
    required this.large,
    required this.medium,
  });

  @JsonKey(name: 'large', defaultValue: '')
  final String? large;
  @JsonKey(name: 'thumbnail', defaultValue: '')
  final String? thumbnail;
  @JsonKey(name: 'medium', defaultValue: '')
  final String? medium;

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
