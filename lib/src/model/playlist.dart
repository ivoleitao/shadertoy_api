import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist extends Equatable {
  @JsonKey(name: 'id')

  /// The playlist id
  final String id;
  @JsonKey(name: 'name')

  /// The playlist name
  final String name;

  @JsonKey(name: 'count')

  /// The number of shaders on the playlist
  final int count;

  @JsonKey(name: 'shaders')

  // The list of shaders on the playlist
  final List<String> shaders;

  /// Builds a [Playlist]
  ///
  /// * [id]: The playlist id
  /// * [name]: The playlist name
  /// * [count]: The number of shaders on the playlist
  /// * [shaders]: The list of shaders on the playlist
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

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [id, name, count, shaders];

  /// Creates a [Playlist] from json map
  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  /// Creates a json map from a [Playlist]
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  /// Builds a copy of a [Playlist]
  ///
  /// * [id]: The playlist id
  /// * [name]: The playlist name
  /// * [count]: The number of shaders on the playlist
  /// * [shaders]: The list of shaders on the playlist
  Playlist copyWith({
    String id,
    String name,
    int count,
    List<String> shaders,
  }) {
    return Playlist(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      shaders: shaders ?? this.shaders,
    );
  }
}
