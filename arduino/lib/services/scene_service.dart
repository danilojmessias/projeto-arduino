import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/scene.dart';

class SceneService {
  // Using the same base URL as DeviceService
  static const String baseUrl = 'http://10.0.2.2:3002';

  static Future<List<Scene>> getScenes(String deviceId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/scenes?deviceId=$deviceId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Scene.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load scenes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching scenes: $e');
    }
  }
}
