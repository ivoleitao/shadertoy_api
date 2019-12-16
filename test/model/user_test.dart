import 'package:shadertoy_api/src/model/user.dart';
import 'package:test/test.dart';

void main() {
  test('Create a user', () {
    var memberSince = DateTime(2000, 1, 1, 0, 0, 0);
    var user = User(
        id: 'id1',
        picture: 'picture1',
        memberSince: memberSince,
        shaders: 1,
        comments: 1,
        about: 'about1');
    expect(user.id, 'id1');
    expect(user.picture, 'picture1');
    expect(user.memberSince, memberSince);
    expect(user.shaders, 1);
    expect(user.comments, 1);
    expect(user.about, 'about1');
  });

  test('Convert a user to a JSON serializable map and back', () {
    var memberSince = DateTime(2000, 1, 1, 0, 0, 0);
    var user1 = User(
        id: 'id1',
        picture: 'picture1',
        memberSince: memberSince,
        shaders: 1,
        comments: 1,
        about: 'about1');

    var json = user1.toJson();
    var user2 = User.fromJson(json);
    expect(user1, equals(user2));
  });
}
