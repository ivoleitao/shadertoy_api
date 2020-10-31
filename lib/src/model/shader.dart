import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
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
  const Shader(
      {@required this.version,
      @required this.info,
      @required this.renderPasses})
      : assert(version != null),
        assert(info != null),
        assert(renderPasses != null);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [version, info, renderPasses];

  /// Creates a [Shader] from json map
  factory Shader.fromJson(Map<String, dynamic> json) => _$ShaderFromJson(json);

  /// Creates a json map from a [Shader]
  Map<String, dynamic> toJson() => _$ShaderToJson(this);

  /// Builds a copy of a [Shader]
  ///
  /// * [version]: The shader version
  /// * [info]: The shader meta information
  /// * [renderPasses]: The shader render passes
  Shader copyWith({
    String version,
    Info info,
    List<RenderPass> renderPasses,
  }) {
    return Shader(
      version: version ?? this.version,
      info: info ?? this.info,
      renderPasses: renderPasses ?? this.renderPasses,
    );
  }
}
