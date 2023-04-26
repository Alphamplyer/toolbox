
import 'dart:io';

class RemoteCommandsService {
  static const String _baseApiUrl = "http://192.168.1.15:5000/remote-commands";
  static const Duration timeLimit = Duration(seconds: 5);
  static HttpClient client = HttpClient()
    ..connectionTimeout = timeLimit;
  
  static Future<void> togglePlayPause() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/togglePlayPause"));
    await request.close();
  }

  static Future<void> stop() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/stop"));
    await request.close();
  }

  static Future<void> next() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/next"));
    await request.close();
  }

  static Future<void> previous() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/previous"));
    await request.close();
  }

  static Future<void> volumeUp() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/volume/up"));
    await request.close();
  }

  static Future<void> volumeDown() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/volume/down"));
    await request.close();
  }

  static Future<void> volumeMute() async {
    HttpClientRequest request = await client.postUrl(Uri.parse("$_baseApiUrl/volume/mute"));
    await request.close();
  }
}