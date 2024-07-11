import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapWidget extends StatefulWidget {
  final LatLng initialPosition;
  final Function(GoogleMapController) onMapCreated;

  MapWidget({required this.initialPosition, required this.onMapCreated});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  List<LatLng> _routePoints = [
    LatLng(37.7749, -122.4194), // Example points
    LatLng(37.7849, -122.4094),
    LatLng(37.7949, -122.3994),
  ];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        widget.onMapCreated(controller);
      },
      initialCameraPosition: CameraPosition(
        target: widget.initialPosition,
        zoom: 12,
      ),
      polylines: _createPolylines(),
    );
  }

  Set<Polyline> _createPolylines() {
    List<LatLng> safeRoute = _routePoints.sublist(0, 1);
    List<LatLng> moderateRoute = _routePoints.sublist(1, 2);
    List<LatLng> unsafeRoute = _routePoints.sublist(2, 3);

    return {
      Polyline(
        polylineId: PolylineId('safe_route'),
        points: safeRoute,
        color: Colors.green,
        width: 5,
      ),
      Polyline(
        polylineId: PolylineId('moderate_route'),
        points: moderateRoute,
        color: Colors.yellow,
        width: 5,
      ),
      Polyline(
        polylineId: PolylineId('unsafe_route'),
        points: unsafeRoute,
        color: Colors.red,
        width: 5,
      ),
    };
  }
}
