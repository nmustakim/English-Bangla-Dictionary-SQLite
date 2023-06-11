import 'package:e2b_dictionary/constants.dart';
import 'package:e2b_dictionary/global_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    toHome();
  }


  void toHome() async {
    await Future.delayed(const Duration(seconds:3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const BottomBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kPrimaryColor,
          ),
          Container(
            height: 420,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(250))),
          ),
           Positioned(
              top: 190,
              left: 40,
              child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'E2B Dictionary',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              )),
          const Positioned(left: 60,top: 250,child: Text('Meaning | Parts of speech | example',style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}