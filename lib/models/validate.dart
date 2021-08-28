class Validate {

  final String message;
  final bool isCondition;
  final Function(String?) onValidate;

  Validate(
      {required this.message,
      required this.onValidate,
      required this.isCondition});
}
