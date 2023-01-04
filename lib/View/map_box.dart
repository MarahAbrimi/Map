import 'dart:developer';

import 'package:map/Backend/services.dart';

import '../helper/exported_packages.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Mapbox extends StatefulWidget {
  const Mapbox({Key? key}) : super(key: key);

  @override
  State<Mapbox> createState() => _MapboxState();
}

class _MapboxState extends State<Mapbox> {
  late double latitude;
  late double longitude;
  // late CameraUpdate cameraUpdate=CameraPosition(target: LatLng(latitude, longitude)) as CameraUpdate;
  late MapboxMapController mapController;
  TextEditingController controller = TextEditingController(); 
  void _onMapCreated(MapboxMapController controller) {
    log("recreated");
    mapController = controller;
  }

  @override
  void initState() {
    log("init");
    latitude = 31.3237107014793;
    longitude = 36.822971823353086;
    //CameraPosition(target:LatLng(latitude, longitude) );
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("THE CURENT VALUE IS --- -> " + latitude.toString());
    log("THE CURENT VALUE IS --- -> " + longitude.toString());
    return Scaffold(
      appBar: AppBar(title: Text("Map"),backgroundColor: Color.fromARGB(255, 7, 26, 43),centerTitle: true,),
        body: Column(children: [
      Container(
        height: 540,
        child: MapboxMap(
            accessToken:
                'pk.eyJ1IjoibWFyYWhoIiwiYSI6ImNsY2czZ2lmNjdtemwzcWtlb3RiNzE2ZGcifQ.IVUXm7b7ZdiiBpMrwC4u1A',
            styleString: "mapbox://styles/marahh/clcg55sja000215o36sjjawzl",
            onMapCreated: _onMapCreated,
            onStyleLoadedCallback: () => addCircle(mapController),
            initialCameraPosition:  CameraPosition(zoom: 5, target: LatLng(latitude, longitude))),
      ),
      // ElevatedButton(
      //   onPressed: (() async {
      //   log("pressed");
      //   var data = await Services().getCities("Dubai","Dubai");
      //   log(data![0].country);

      //   setState(() {
      //     mapController.clearCircles();
      //     latitude = data[0].latitude;
      //     longitude = data[0].longitude;
      //     CameraPosition(target:LatLng(latitude, longitude) );
      //    // cameraPosition =CameraPosition(zoom: 5, target: LatLng(latitude, longitude));
      //     mapController.addCircle(CircleOptions(
      //       geometry: LatLng(latitude, longitude),
      //       circleColor: '#23d2aa',
      //       circleRadius: 15,
      //     ));

           
      //   });

      // }), child: Text("marah"),),
      SizedBox(height: 8,),
      Center(
        child: AnimationSearchBar(
          searchBarWidth:500,
          searchBarHeight: 40,
          closeIconColor: const Color.fromARGB(255, 7, 26, 43),
          searchIconColor: const Color.fromARGB(255, 7, 26, 43),
          backIconColor: const Color.fromARGB(255, 7, 26, 43),
   centerTitle: 'search',
   centerTitleStyle:const TextStyle(color: Color.fromARGB(255, 7, 26, 43),fontSize: 20 ),
   onChanged:(((p0) async{
        log("pressed");
          var data = await Services().getCities(controller.text,controller.text);
          log(data![0].country);
          setState(() {
           
            mapController.clearCircles();
            latitude = data[0].latitude;
            longitude = data[0].longitude;
          //  CameraPosition(target:LatLng(latitude, longitude) );
           //cameraUpdate =CameraPosition(zoom: 5, target: LatLng(latitude, longitude));
            mapController.addCircle(CircleOptions(
              geometry: LatLng(latitude, longitude),
              circleColor: '#23d2aa',
              circleRadius: 15,
            ));
           mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom: 5,target: LatLng(latitude, longitude))));

             
          });
   })) ,
   searchTextEditingController: controller,
   horizontalPadding: 5),
      )
      
    ]));
  }

  void addCircle(MapboxMapController mapController) {
    log("addCircle -> " + latitude.toString());
    log("addCircle -> " + longitude.toString());
    mapController.addCircle(CircleOptions(
      geometry: LatLng(latitude, longitude),
      circleColor: '#23d2aa',
      circleRadius: 15,
    ));
  }
}
