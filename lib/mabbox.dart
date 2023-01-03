import 'helper/exported_packages.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
class Mabbox extends StatefulWidget {
  const Mabbox({ Key? key }) : super(key: key);

  @override
  State<Mabbox> createState() => _MabboxState();
}

class _MabboxState extends State<Mabbox> {
  late MapboxMapController mapController;
  void _onMapCreated(MapboxMapController controller){
    mapController=controller;
  }
  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        accessToken: 'pk.eyJ1IjoibWFyYWhoIiwiYSI6ImNsY2czZ2lmNjdtemwzcWtlb3RiNzE2ZGcifQ.IVUXm7b7ZdiiBpMrwC4u1A',
        styleString: "mapbox://styles/marahh/clcg4ppen001y15qqbi6vekuz",
        onMapCreated: _onMapCreated,
        onStyleLoadedCallback: () => addCircle(mapController),
        initialCameraPosition: const CameraPosition(zoom: 14,target: LatLng(31.3237107014793, 36.822971823353086))),
    );
  }
  void addCircle(MapboxMapController mapController){
    mapController.addCircle(const CircleOptions(
      geometry: LatLng(31.3237107014793, 36.822971823353086),
      circleColor: '#23d2aa',
      circleRadius: 15,
    ));
  }
}