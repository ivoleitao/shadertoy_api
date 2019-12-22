import 'package:shadertoy_api/src/model/playlist.dart';
import 'package:test/test.dart';

void main() {
  var playlist1 = Playlist(id: 'id1', name: 'name1', count: 1, shaders: ['1']);
  test('Create a playlist', () {
    expect(playlist1.id, 'id1');
    expect(playlist1.name, 'name1');
    expect(playlist1.count, 1);
    expect(playlist1.shaders, ['1']);
  });

  test('Convert a output to a JSON serializable map and back', () {
    var json = playlist1.toJson();
    var playlist2 = Playlist.fromJson(json);
    expect(playlist1, equals(playlist2));
  });
}
