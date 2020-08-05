import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'shaders')
  final List<String> shaders;

  const Playlist(
      {@required this.id,
      @required this.name,
      @required this.count,
      @required this.shaders})
      : assert(id != null),
        assert(name != null),
        assert(count != null),
        assert(shaders != null);

  @override
  List<Object> get props => [id, name, count, shaders];

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
