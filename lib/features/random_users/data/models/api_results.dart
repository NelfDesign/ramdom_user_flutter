import 'package:json_annotation/json_annotation.dart';
import 'package:randomuserflutter/features/random_users/data/models/user.dart';

part 'api_results.g.dart';

@JsonSerializable()
class ApiResults {
  const ApiResults({
    required this.results,
  });

  factory ApiResults.fromJson(Map<String, dynamic> json) => _$ApiResultsFromJson(json);

  @JsonKey(name: 'results', defaultValue: <User>[])
  final List<User> results;

  Map<String, dynamic> toJson() => _$ApiResultsToJson(this);
}
