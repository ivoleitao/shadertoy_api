import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'output.g.dart';

@JsonSerializable()

/// Render pass output class
class Output extends Equatable {
  /// Transforms a input to string or uses an existing int value
  static String _idFromJson(dynamic input) =>
      input is int ? input.toString() : input;

  @JsonKey(name: 'id', fromJson: _idFromJson)

  /// The input id
  final String id;

  /// The channel number
  @JsonKey(name: 'channel')
  final int channel;

  /// Builds a [Output]
  ///
  /// * [id]: The input id
  /// * [channel]: the channel number
  const Output({@required this.id, @required this.channel})
      : assert(id != null),
        assert(channel != null);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [id, channel];

  /// Creates a [Output] from json map
  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);

  /// Creates a json map from a [Output]
  Map<String, dynamic> toJson() => _$OutputToJson(this);

  /// Builds a [Output]
  ///
  /// * [id]: The input id
  /// * [channel]: the channel number
  Output copyWith({String id, int channel}) {
    return Output(id: id ?? this.id, channel: channel ?? this.channel);
  }
}
