class TransferException implements Exception {
  final String message;

  TransferException(this.message);

  @override
  String toString() => 'TransferException: $message';
}