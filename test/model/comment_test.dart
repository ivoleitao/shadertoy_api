import 'package:shadertoy_api/src/model/comment.dart';
import 'package:test/test.dart';

void main() {
  test('Create a comment', () {
    var now = DateTime.now();
    var comment = Comment(
        shaderId: 'shaderId1', userId: 'userId1', date: now, text: 'text1');
    expect(comment.shaderId, 'shaderId1');
    expect(comment.userId, 'userId1');
    expect(comment.date, now);
    expect(comment.text, 'text1');
  });

  test('Convert the comment to a JSON serializable map and back', () {
    var now = DateTime.now();
    var comment1 = Comment(
        shaderId: 'shaderId1', userId: 'userId1', date: now, text: 'text1');
    var json = comment1.toJson();
    var comment2 = Comment.fromJson(json);
    expect(comment1, equals(comment2));
  });
}
