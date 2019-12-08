import 'package:shadertoy_api/src/converter/epoch_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Convert a integer in seconds to an epoch and back', () {
    var converter = IntEpochInSecondsConverter();
    var value = 123123123;
    expect(converter.fromJson(value),
        DateTime.fromMillisecondsSinceEpoch(value * 1000));
    expect(converter.toJson(DateTime.fromMillisecondsSinceEpoch(value * 1000)),
        value);
  });

  test('Convert a integer in miliseconds to an epoch and back', () {
    var converter = IntEpochInMilisecondsConverter();
    var value = 123123123;
    expect(
        converter.fromJson(value), DateTime.fromMillisecondsSinceEpoch(value));
    expect(converter.toJson(DateTime.fromMillisecondsSinceEpoch(value)), value);
  });

  test('Convert a integer in microseconds to an epoch and back', () {
    var converter = IntEpochInMicrocondsConverter();
    var value = 123123123;
    expect(
        converter.fromJson(value), DateTime.fromMicrosecondsSinceEpoch(value));
    expect(converter.toJson(DateTime.fromMicrosecondsSinceEpoch(value)), value);
  });

  test('Convert a String in seconds to an epoch and back', () {
    var converter = StringEpochInSecondsConverter();
    var value = 123123123;
    expect(converter.fromJson(value.toString()),
        DateTime.fromMillisecondsSinceEpoch(value * 1000));
    expect(converter.toJson(DateTime.fromMillisecondsSinceEpoch(value * 1000)),
        value.toString());
  });

  test('Convert a String in miliseconds to an epoch and back', () {
    var converter = StringEpochInMilisecondsConverter();
    var value = 123123123;
    expect(converter.fromJson(value.toString()),
        DateTime.fromMillisecondsSinceEpoch(value));
    expect(converter.toJson(DateTime.fromMillisecondsSinceEpoch(value)),
        value.toString());
  });

  test('Convert a String in microseconds to an epoch and back', () {
    var converter = StringEpochInMicrocondsConverter();
    var value = 123123123;
    expect(converter.fromJson(value.toString()),
        DateTime.fromMicrosecondsSinceEpoch(value));
    expect(converter.toJson(DateTime.fromMicrosecondsSinceEpoch(value)),
        value.toString());
  });
}
