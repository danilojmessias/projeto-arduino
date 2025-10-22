class Device {
  final String id;
  final String name;
  final String ip;
  final DateTime createdAt;

  Device({
    required this.id,
    required this.name,
    required this.ip,
    required this.createdAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as String,
      name: json['name'] as String,
      ip: json['ip'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ip': ip,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class CreateDeviceRequest {
  final String name;
  final String ip;

  CreateDeviceRequest({required this.name, required this.ip});

  Map<String, dynamic> toJson() {
    return {'name': name, 'ip': ip};
  }
}
