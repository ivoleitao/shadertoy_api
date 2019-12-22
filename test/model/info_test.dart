import 'package:shadertoy_api/src/model/info.dart';
import 'package:test/test.dart';

void main() {
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

  test('Create a info', () {
    expect(info1.id, 'id1');
    expect(info1.date, date);
    expect(info1.views, 1);
    expect(info1.name, 'name1');
    expect(info1.userId, 'userId1');
    expect(info1.description, 'description1');
    expect(info1.likes, 1);
    expect(info1.publishStatus, PublishStatus.public_api);
    expect(info1.flags, 1);
    expect(info1.tags, ['test1']);
    expect(info1.hasLiked, true);
  });

  test('Convert a info to a JSON serializable map and back', () {
    var json = info1.toJson();
    var info2 = Info.fromJson(json);
    expect(info1, equals(info2));
  });
}
