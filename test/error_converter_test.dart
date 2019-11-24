import 'package:shadertoy_api/shadertoy_api.dart';
import 'package:shadertoy_api/src/converter/error_converter.dart';
import "package:test/test.dart";

void main() {
  test("Builds a error from a string message and vice-versa", () {
    var converter = ResponseErrorConverter();
    expect(converter.fromJson('message'), ResponseError(message: 'message'));
    expect(converter.toJson(ResponseError(message: 'message')), 'message');
  });
}
