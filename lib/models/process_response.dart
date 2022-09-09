class ProcessResponse {
  final bool success;
  final String message;

  ProcessResponse({
    required this.message,
    this.success = false,
  });
}
