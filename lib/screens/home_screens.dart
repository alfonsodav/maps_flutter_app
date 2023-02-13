import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScrens extends StatefulWidget {
  const HomeScrens({super.key});

  @override
  State<HomeScrens> createState() => _HomeScrensState();
}

class _HomeScrensState extends State<HomeScrens> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(9.2706848, -70.7797205);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int counter = 0;
  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = 32.0;
    const myTextStyle = TextStyle(color: Colors.blue, fontSize: fontSize);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          elevation: 2.0,
        ),
        backgroundColor: Colors.white,
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _CustomFloatingActions(
          increaseFn: increase,
        ));
  }
}

class _CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  const _CustomFloatingActions({
    Key? key,
    required this.increaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () => increaseFn(),
      /* (() {
        setState(() {
          counter++;
        });
        print(counter);
      }), */
      child: const Icon(Icons.navigation),
    );
  }
}
