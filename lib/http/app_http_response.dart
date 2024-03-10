class AppHttpResponse {
  final Map<String, dynamic>? decodedJson;
  final bool isValid;

  AppHttpResponse.success({required this.decodedJson}) : isValid = true;

  AppHttpResponse.failed()
      : isValid = false,
        decodedJson = null;
}
