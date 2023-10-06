import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff42c6ff),
        body: Column(
          children: [
            //Header
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
              child: Row(
                children: [
                  Icon(Icons.menu_outlined),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    'New York',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // date
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'Friday 20 January',
                style: TextStyle(
                  color: Color(0xff42c6ff),
                  fontSize: 15,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 20,
            ),
            //sunny/cloudy......
            Text(
              'Sunny',
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
              "28°",
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
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.waves,
                        color: Color(0xff42c6ff),
                      ),
                      Text(
                        '2km/h',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.water_drop_outlined,
                        color: Color(0xff42c6ff),
                      ),
                      Text(
                        '78%',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        color: Color(0xff42c6ff),
                      ),
                      Text(
                        '1km',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ),
      ),
    );
  }
}
