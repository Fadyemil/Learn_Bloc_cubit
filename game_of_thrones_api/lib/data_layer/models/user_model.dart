import 'package:game_of_thrones_api/data_layer/core/Api/end_point.dart';

class UserModel {
  final Location location;
  // final String id;
  final String name;
  final String phone;
  final String email;
  final String profilePic;

  UserModel({
    required this.location,
    // required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.profilePic,
    // required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      location: Location.fromJson(json['user']['location']),
      name: json['user'][ApiKey.name],
      phone: json['user'][ApiKey.phone],
      email: json['user'][ApiKey.email],
      profilePic: json['user'][ApiKey.profilePic],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      // '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'favorites': profilePic,
      // 'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}