class ApiException implements Exception {
  final String message;

  ApiException(this.message); // Pass your message in constructor.

  @override
  String toString() {
    return message;
  }
}
