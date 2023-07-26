class MyApiResponse {
  final dynamic data;
  final String responseMessage;
  final bool status;

  MyApiResponse({
    required this.data,
    required this.responseMessage,
    required this.status,
  });

  @override
  String toString() {
    return 'MyApiResponse(data: $data, errorMessage: $responseMessage, status: $status)';
  }
}
