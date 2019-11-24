final RegExp CodePairsRegExp = RegExp(r'\d{3}');

String shaderIdToFileName(String shaderId) {
  return shaderId.runes.fold(
      '',
      (previousValue, element) =>
          previousValue + element.toString().padLeft(3, '0'));
}

String fileNameToShaderId(String fileName) {
  return String.fromCharCodes(
      CodePairsRegExp.allMatches(fileName).map((m) => int.parse(m.group(0))));
}
