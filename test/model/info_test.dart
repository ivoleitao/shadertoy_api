import 'package:shadertoy_api/src/model/info.dart';
import 'package:test/test.dart';

void main() {
  test('Create a info', () {
    var date = DateTime(2000, 1, 1, 0, 0, 0);
    var info = Info(
        id: 'id1',
        date: date,
        views: 1,
        name: 'name1',
        userId: 'userId1',
        description: 'description1',
        likes: 1,
        publishStatus: PublishStatus.public_api,
        flags: 1,
        tags: ['test1'],
        hasLiked: true);
    expect(info.id, 'id1');
    expect(info.date, date);
    expect(info.views, 1);
    expect(info.name, 'name1');
    expect(info.userId, 'userId1');
    expect(info.description, 'description1');
    expect(info.likes, 1);
    expect(info.publishStatus, PublishStatus.public_api);
    expect(info.flags, 1);
    expect(info.tags, ['test1']);
    expect(info.hasLiked, true);
  });

  test('Convert a info to a JSON serializable map and back', () {
    var date = DateTime(2000, 1, 1, 0, 0, 0);
    var info1 = Info(
        id: 'id1',
        date: date,
        views: 1,
        name: 'name1',
        userId: 'userId1',
        description: 'description1',
        likes: 1,
        publishStatus: PublishStatus.public_api,
        flags: 1,
        tags: ['test1'],
        hasLiked: true);

    var json = info1.toJson();
    var info2 = Info.fromJson(json);
    expect(info1, equals(info2));
  });
}
