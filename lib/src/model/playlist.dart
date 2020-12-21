import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'playlist.g.dart';

enum PlaylistPublishStatus {
  @JsonValue(0)

  /// Is not shared with anybody
  private,

  @JsonValue(1)

  /// Is visible to anyone who has a direct link
  unlisted,

  @JsonValue(2)

  /// Is visible to anyone
  public,
}

@JsonSerializable()
class Playlist extends Equatable {
  @JsonKey(name: 'id')

  /// The playlist id
  final String id;

  @JsonKey(name: 'userId')

  /// The user id
  final String userId;

  @JsonKey(name: 'name')

  /// The playlist name
  final String name;

  @JsonKey(name: 'description')

  /// The playlist description
  final String description;

  @JsonKey(name: 'published')

  /// The publish status
  final PlaylistPublishStatus publishStatus;

  @JsonKey(name: 'shaders')

  /// The number of shaders on the playlist
  final int shaders;

  /// Builds a [Playlist]
  ///
  /// * [id]: The playlist id
  /// * [userId]: The user id
  /// * [name]: The playlist name
  /// * [description]: The playlist description
  /// * [publishStatus]: The publish status
  /// * [shaders]: The number of shaders on the playlist
  const Playlist(
      {@required this.id,
      @required this.userId,
      @required this.name,
      @required this.description,
      @required this.publishStatus,
      @required this.shaders})
      : assert(id != null),
        assert(userId != null),
        assert(name != null),
        assert(description != null),
        assert(publishStatus != null),
        assert(shaders != null);

  @override
  List<Object> get props =>
      [id, userId, name, description, publishStatus, shaders];

  /// Creates a [Playlist] from json map
  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  /// Creates a json map from a [Playlist]
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  /// Builds a copy of a [Playlist]
  ///
  /// * [id]: The playlist id
  /// * [userId]: The user id
  /// * [name]: The playlist name
  /// * [description]: The playlist description
  /// * [publishStatus]: The publish status
  /// * [shaders]: The number of shaders on the playlist
  Playlist copyWith(
      {String id,
      String userId,
      String name,
      String description,
      PlaylistPublishStatus publishStatus,
      int shaders}) {
    return Playlist(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        description: description ?? this.description,
        publishStatus: publishStatus ?? this.publishStatus,
        shaders: shaders ?? this.shaders);
  }
}
