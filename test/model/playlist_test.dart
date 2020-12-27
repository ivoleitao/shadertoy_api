import 'package:shadertoy_api/src/model/playlist.dart';
import 'package:test/test.dart';

void main() {
  var playlist1 = Playlist(
      id: 'week',
      userId: 'shadertoy',
      name: 'Shaders of the Week',
      description: 'Playlist with every single shader of the week ever.',
      privacy: PlaylistPrivacy.public);

  test('Test a playlist', () {
    expect(playlist1.id, 'week');
    expect(playlist1.userId, 'shadertoy');
    expect(playlist1.name, 'Shaders of the Week');
    expect(playlist1.description,
        'Playlist with every single shader of the week ever.');
    expect(playlist1.privacy, PlaylistPrivacy.public);
  });

  test('Convert a output to a JSON serializable map and back', () {
    var json = playlist1.toJson();
    var playlist2 = Playlist.fromJson(json);
    expect(playlist1, equals(playlist2));
  });
}
