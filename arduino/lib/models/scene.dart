class Scene {
  final String id;
  final String name;
  final String deviceId;
  final DateTime createdAt;

  Scene({
    required this.id,
    required this.name,
    required this.deviceId,
    required this.createdAt,
  });

  factory Scene.fromJson(Map<String, dynamic> json) {
    return Scene(
      id: json['id'] as String,
      name: json['name'] as String,
      deviceId: json['deviceId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'deviceId': deviceId,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
