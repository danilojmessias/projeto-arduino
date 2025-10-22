import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/device.dart';

class DeviceService {
  // You can change this base URL to match your API server
  static const String baseUrl = 'http://10.0.2.2:3002'; // Adjust as needed

  static Future<List<Device>> getDevices() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/devices'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Device.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load devices: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching devices: $e');
    }
  }

  static Future<Device> createDevice(CreateDeviceRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/devices'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(request.toJson()),
      );

      if (response.statusCode == 201) {
        return Device.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create device: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating device: $e');
    }
  }
}
