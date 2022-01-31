import 'dart:async';

class FakeApiService {
  Future<String> loadFakeData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return "Fake Api call completed";
  }
}
