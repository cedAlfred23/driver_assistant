import 'package:driver_assistant/screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "LexendDeca",
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "LexendDeca");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "LexendDeca");
  static const TextStyle goldCoinBlackStyle = TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "LexendDeca");

  static const TextStyle greyStyle =
      TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "LexendDeca");

  static const TextStyle whiteStyle =
      TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "LexendDeca");

  static const TextStyle blueStyle = TextStyle(
      fontSize: 40.0, color: Color(0xff404040), fontFamily: "LexendDeca");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.black,
    fontFamily: "LexendDeca",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "LexendDeca",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "LexendDeca",
  );

  static const TextStyle descriptionBlueStyle = TextStyle(
    color: Color(0xff404040),
    fontSize: 20.0,
    fontFamily: "LexendDeca",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: [
            Container(
              color: const Color(0xffb6e4f8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/logo.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Driver Assistant",
                                style: goldCoinBlackStyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: const Text(
                            "Login",
                            style: goldCoinBlackStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Lottie.asset("assets/lottie/face-scan.json",
                        width: 300, fit: BoxFit.fill),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Eye",
                          style: greyStyle,
                        ),
                        Text(
                          "Detection",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "With our real time\n"
                          "trained model, we detect\n"
                          "drowsiness levels",
                          style: descriptionGreyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: const Color(0xffefefef),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/logo.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Driver Assistant",
                                style: goldcoinGreyStyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: const Text(
                            "Login",
                            style: goldcoinGreyStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Lottie.asset("assets/lottie/secure.json"),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Better",
                          style: blueStyle,
                        ),
                        Text(
                          "Security",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "All of your data is secure\n"
                          "and is in safe hands. So\n"
                          "be rest assured",
                          style: descriptionBlueStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/logo.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Driver Assistant",
                                style: goldCoinWhiteStyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: const Text(
                            "Login",
                            style: goldCoinWhiteStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Lottie.asset("assets/lottie/drive.json"),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Safe",
                          style: whiteStyle,
                        ),
                        Text(
                          "Driving",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "So, a step towards\n"
                          "safe driving?\n"
                          "",
                          style: descriptionWhiteStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
          enableLoop: true,
          fullTransitionValue: 300,
          // enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    );
  }
}