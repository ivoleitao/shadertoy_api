import 'package:shadertoy_api/src/model/comment.dart';
import 'package:test/test.dart';

void main() {
  var now = DateTime.now();
  var comment1 = Comment(
      shaderId: 'shaderId1', userId: 'userId1', date: now, text: 'text1');

  test('Test a comment', () {
    expect(comment1.shaderId, 'shaderId1');
    expect(comment1.userId, 'userId1');
    expect(comment1.date, now);
    expect(comment1.text, 'text1');
  });

  test('Test the comment to a JSON serializable map and back', () {
    var json = comment1.toJson();
    var comment2 = Comment.fromJson(json);
    expect(comment1, equals(comment2));
  });
}
