import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shadertoy_api/src/model/sampler.dart';

part 'input.g.dart';

/// The input type
enum InputType {
  /// Texture
  texture,

  /// Volume
  volume,

  /// Cubemap
  cubemap,

  /// Music
  music,

  /// Music stream
  musicstream,

  /// Mic
  mic,

  /// Buffer
  buffer,

  /// Keyboard
  keyboard,

  /// Video
  video,

  /// Webcam
  webcam
}

@JsonSerializable()

/// An input
class Input extends Equatable {
  /// Transforms a input to string or uses an existing int value
  static String _idFromJson(dynamic input) =>
      input is int ? input.toString() : input;

  @JsonKey(name: 'id', fromJson: _idFromJson)

  /// The input id
  final String id;

  @JsonKey(name: 'src')

  /// The source
  final String src;

  @JsonKey(name: 'ctype')

  /// The input type
  final InputType type;

  @JsonKey(name: 'channel')

  /// The channel number
  final int channel;

  @JsonKey(name: 'sampler')

  /// The sampler
  final Sampler sampler;

  @JsonKey(name: 'published')

  /// The published
  final int published;

  /// Builds a [Input]
  ///
  /// * [id]: The input id
  /// * [src]: The source
  /// * [type]: The type
  /// * [channel]: The channel number
  /// * [sampler]: The sampler
  /// * [published]: The published
  const Input(
      {this.id,
      this.src,
      this.type,
      this.channel,
      this.sampler,
      this.published});

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [id, src, type, channel, sampler, published];

  /// Creates a [Input] from json map
  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);

  /// Creates a json map from a [Input]
  Map<String, dynamic> toJson() => _$InputToJson(this);
}
