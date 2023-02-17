import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage( //image for background
            fit: BoxFit.cover,
            image: AssetImage('assets/images/movie_bg_1.jpg'),
          ),
        ),
        child: Stack( // stack for overlay and logo, texts
          children: [
            Container( // container for overlay
              height: double.infinity,
              color: const Color(0xff131537).withOpacity(0.4),
            ),
            Center( //contains logo and text
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Image(image: AssetImage('assets/images/movie_logo.png')),
                  Text(
                    'Movieto',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Find the greatest and latest movie shows on available on movieto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
