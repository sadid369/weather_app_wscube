import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_wscube/Model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentLocation;
  // late Future<WeatherModel> weatherModel;

  void current() async {
    _currentLocation = await _getMyCurrentPosition();
    print(
        "${_currentLocation!.latitude.toString()} ${_currentLocation!.longitude.toString()}");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    current();
  }

  Future<WeatherModel> getWeatherData(String lat, String lon) async {
    // WeatherModel weatherModel;
    // print(lat + lon);
    var url = Uri.parse(
      "http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=f7b78edd4c1abcd5e778bc977fac54c8&units=metric",
    );
    var res = await http.get(url);
    print(WeatherModel.fromJson(jsonDecode(res.body)));
    return WeatherModel.fromJson(jsonDecode(res.body));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _currentLocation == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                backgroundColor: Color(0xff42c6ff),
                body: FutureBuilder<WeatherModel>(
                  future: getWeatherData(_currentLocation!.latitude.toString(),
                      _currentLocation!.longitude.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      // print(snapshot.data!.listData![0].main!.temp);
                      return Column(
                        children: [
                          //Header
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 15),
                            child: Row(
                              children: [
                                Icon(Icons.menu_outlined),
                                SizedBox(
                                  width: 120,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    setState(() {});
                                    print(_currentLocation);
                                  },
                                  child: Text(
                                    '${snapshot.data!.city!.country}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              '${DateTime.now().toIso8601String()}',
                              style: TextStyle(
                                color: Color(0xff42c6ff),
                                fontSize: 15,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //sunny/cloudy......
                          Text(
                            '${snapshot.data!.listData![0].weather![0].description!.toUpperCase()}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Celsius
                          Text(
                            // "${snapshot.data!.listData![0].main!.temp}",
                            "${(snapshot.data!.listData![0].main!.temp as num).floor()}°",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 180,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // daily Summary heading
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Daily Summary",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // daily summary body
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              "Pariatur non voluptate incididunt fugiat. Sunt quis proident labore nostrud ea eu exercitation. Lorem exercitation commodo nostrud cillum aliquip",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Wind Visibility Humidity
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.waves,
                                      color: Color(0xff42c6ff),
                                    ),
                                    Text(
                                      '${snapshot.data!.listData![0].wind!.speed!.floor()}km/h',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        color: Color(0xff42c6ff),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      'Wind',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        color: Color(0xff42c6ff),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.water_drop_outlined,
                                      color: Color(0xff42c6ff),
                                    ),
                                    Text(
                                      '${snapshot.data!.listData![0].main!.humidity}%',
                                      style: TextStyle(
                                        color: Color(0xff42c6ff),
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        color: Color(0xff42c6ff),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.visibility_outlined,
                                      color: Color(0xff42c6ff),
                                    ),
                                    Text(
                                      '${(snapshot.data!.listData![0].visibility! / 1000).floor()}km',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        color: Color(0xff42c6ff),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      'Visibility',
                                      style: TextStyle(
                                        color: Color(0xff42c6ff),
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // Weekly Forecast heading
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Weekly forcast",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          // weakly forecast body
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(8),
                                  height: 90,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "27°",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.water_drop,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "21 jan",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.all(8),
                                  height: 90,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "27°",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.water_drop,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "21 jan",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.all(8),
                                  height: 90,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "27°",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.water_drop,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "21 jan",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.all(8),
                                  height: 90,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "27°",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.water_drop,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "21 jan",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    }
                    return Container();
                  },
                ),
              ));
  }

  Future<Position> _getMyCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
