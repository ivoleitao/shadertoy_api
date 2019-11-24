import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

/// Used to call the Shadertoy site API with the shader ids to resolve
@JsonSerializable()
class FindShadersRequest extends Equatable {
  @JsonKey(name: 'shaders')

  /// The set of ids
  final Set<String> ids;

  /// Builds a find shaders request
  const FindShadersRequest(this.ids);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [ids];

  /// Creates a [FindShadersRequest] from json map
  factory FindShadersRequest.fromJson(Map<String, dynamic> json) =>
      _$FindShadersRequestFromJson(json);

  /// Creates a json map from a [FindShadersRequest]
  Map<String, dynamic> toJson() => _$FindShadersRequestToJson(this);
}
