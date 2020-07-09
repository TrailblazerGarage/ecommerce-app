bool isNumeric( String input) {
  if (input.isEmpty ) return false;

  final inputParsedAsNumber = num.tryParse(input);
  return ( inputParsedAsNumber == null ) ? false : true;
}