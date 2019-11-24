import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shadertoy_api/src/model/info.dart';
import 'package:shadertoy_api/src/model/render_pass.dart';

part 'shader.g.dart';

@JsonSerializable()

/// The Shader class
class Shader extends Equatable {
  @JsonKey(name: 'ver')

  /// The shader version
  final String version;

  @JsonKey(name: 'info')

  /// The shader meta information
  final Info info;

  @JsonKey(name: 'renderpass')

  /// The shader render passes
  final List<RenderPass> renderPasses;

  /// Builds a [Shader]
  ///
  /// * [version]: The shader version
  /// * [info]: The shader meta information
  /// * [renderPasses]: The shader render passes
  const Shader({this.version, this.info, this.renderPasses});

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [version, info, renderPasses];

  /// Creates a [Shader] from json map
  factory Shader.fromJson(Map<String, dynamic> json) => _$ShaderFromJson(json);

  /// Creates a json map from a [Shader]
  Map<String, dynamic> toJson() => _$ShaderToJson(this);
}
