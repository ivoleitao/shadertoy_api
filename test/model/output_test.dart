import 'package:shadertoy_api/src/model/output.dart';
import 'package:test/test.dart';

void main() {
  test('Create a output', () {
    var output = Output(id: 'id1', channel: 1);
    expect(output.id, 'id1');
    expect(output.channel, 1);
  });

  test('Convert a output to a JSON serializable map and back', () {
    var output1 = Output(id: 'id1', channel: 1);

    var json = output1.toJson();
    var output2 = Output.fromJson(json);
    expect(output1, equals(output2));
  });
}
