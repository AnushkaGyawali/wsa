import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<Position> estimatePosition(Position lastPosition, double speed, double direction, Duration duration) async {
    double distance = speed * duration.inSeconds;
    double deltaLat = distance * (1 / 110540) * Math.cos(direction); // Approx. conversion for latitude
    double deltaLng = distance * (1 / (111320 * Math.cos(lastPosition.latitude))) * Math.sin(direction); // Approx. conversion for longitude

    return Position(
      latitude: lastPosition.latitude + deltaLat,
      longitude: lastPosition.longitude + deltaLng,
      timestamp: DateTime.now(),
      altitude: lastPosition.altitude,
      accuracy: lastPosition.accuracy,
      heading: lastPosition.heading,
      speed: lastPosition.speed,
      speedAccuracy: lastPosition.speedAccuracy,
    );
    import 'package:geolocator/geolocator.dart';
    import 'package:cloud_firestore/cloud_firestore.dart';

    class LocationService {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    }

    void updateLocation(Position position, String userId) async {
    await _firestore.collection('users').doc(userId).update({
    'location': GeoPoint(position.latitude, position.longitude),
    'timestamp': Timestamp.now(),
    });
    }

    Future<Position> estimatePosition(Position lastPosition, double speed, double direction, Duration duration) async {
    double distance = speed * duration.inSeconds;
    double deltaLat = distance * (1 / 110540) * Math.cos(direction); // Approx. conversion for latitude
    double deltaLng = distance * (1 / (111320 * Math.cos(lastPosition.latitude))) * Math.sin(direction); // Approx. conversion for longitude

    return Position(
    latitude: lastPosition.latitude + deltaLat,
    longitude: lastPosition.longitude + deltaLng,
    timestamp: DateTime.now(),
    altitude: lastPosition.altitude,
    accuracy: lastPosition.accuracy,
    heading: lastPosition.heading,
    speed: lastPosition.speed,
    speedAccuracy: lastPosition.speedAccuracy,
    );
    }
    }
  }
}
