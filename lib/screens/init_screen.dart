import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cubit/cubit_news.dart';
import 'package:news_app/screens/home_screen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/onBoarding.jpg'),
          ),
        ),
        child: Container(
          color: Colors.black54,
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Column(
                  children: [
                    Text(
                      'Stay Informed form Day One',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Discover the Latest Mews with our Seamless Onboarding Experience6',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: MaterialButton(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  minWidth: double.infinity,
                  height: 45,
                  color: Colors.brown.shade400,
                  onPressed: () =>
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => BlocProvider(create: (BuildContext context)=>CubitNews()..getDataNews(),
                        child: HomeScreen())))
                  ,
                  child: Text(
                    'Geting Started',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
