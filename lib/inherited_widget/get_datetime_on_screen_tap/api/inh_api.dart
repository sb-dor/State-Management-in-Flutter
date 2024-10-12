class InhApi {
  String? dateAndTime;

  Future<String> getDateAndTime() async {
    return Future.delayed(const Duration(seconds: 1), () => DateTime.now().toIso8601String()).then(
      (value) {
        dateAndTime = value;
        return value;
      },
    );
  }
}
