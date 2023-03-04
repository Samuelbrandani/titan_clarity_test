import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static const String dev = 'dev';

  static Future<void> _init({required String flavor}) async {
    await dotenv.load(fileName: '.${flavor}_env');
  }

  static Future<void> flavorDev() async {
    await _init(flavor: dev);
  }
}
