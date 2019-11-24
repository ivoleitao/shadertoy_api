import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shadertoy_api/src/model/input.dart';
import 'package:shadertoy_api/src/model/output.dart';

part 'render_pass.g.dart';

/// Render pass type
enum RenderPassType {
  /// Sound
  sound,

  /// Common
  common,

  /// Image
  image,

  /// Buffer
  buffer,

  /// Cubemap
  cubemap
}

@JsonSerializable()

/// Renderpass class
class RenderPass extends Equatable {
  @JsonKey(name: 'name')

  /// The name of the render pass
  final String name;

  @JsonKey(name: 'type')

  /// The type of the render pass
  final RenderPassType type;

  @JsonKey(name: 'description')

  /// The render pass description
  final String description;

  @JsonKey(name: 'code')

  /// the code
  final String code;

  @JsonKey(name: 'inputs')

  /// The list of inputs
  final List<Input> inputs;

  @JsonKey(name: 'outputs')

  /// The list of outputs
  final List<Output> outputs;

  /// Builds a [RenderPass]
  ///
  /// * [name]: The render pass name
  /// * [type]: The render pass type
  /// * [description]: The render pass description
  /// * [code]: The render pass code
  /// * [inputs]: The list of [Input]
  /// * [outputs]: The list of [Output]
  const RenderPass(
      {this.name,
      this.type,
      this.description,
      this.code,
      this.inputs,
      this.outputs});

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [name, type, description, code, inputs, outputs];

  /// Creates a [RenderPass] from json map
  factory RenderPass.fromJson(Map<String, dynamic> json) =>
      _$RenderPassFromJson(json);

  /// Creates a json map from a [RenderPass]
  Map<String, dynamic> toJson() => _$RenderPassToJson(this);
}
