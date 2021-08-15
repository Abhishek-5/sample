import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sample/secondScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraPosition currentPostion =
      CameraPosition(target: LatLng(26.835690, 75.829590), zoom: 15);
      List<Marker> _markers = <Marker>[];
  var position;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPostion = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 18,
      );
      _markers.add(
      Marker(
      markerId: MarkerId('Id'),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: InfoWindow(
      title: 'Current Location Marker'
      )
     )
   );
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.835690, 75.829590),
    zoom: 15,
  );

  // CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(26.835690, 75.829590),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://s3images.zee5.com/wp-content/uploads/sites/7/2021/03/ranbir-kapoor-784x441.jpg', height: 25, width: 25, fit: BoxFit.fill,),
            SizedBox(width: 5,),
            Text("HomePage"),
          ],
        ),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.80,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(_markers),
                initialCameraPosition: currentPostion,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
              ),
            ),
            Positioned(
              bottom: 0,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueAccent,
                  height: MediaQuery.of(context).size.height*.09, alignment: Alignment.center, child: Text("Next Page", 
                  style: TextStyle(color: Colors.white, fontSize: 18),))),
            )
          ],
        ),
      ),
      
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('Current Location'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPostion));
  }
}
