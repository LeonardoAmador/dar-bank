class UnauthorizedAccountException implements Exception {
  final String message;

  UnauthorizedAccountException(this.message);

  @override
  String toString() => 'UnauthorizedAccountException: $message';
}