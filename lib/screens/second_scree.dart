import 'package:flutter/material.dart';
import 'package:fluttergrammersmovie/data/movie_data.dart';
import 'package:fluttergrammersmovie/models/movie_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //cateegoory list
    List cat = [
      'All',
      'Action',
      'Comedy',
      'Anime',
      'Horror',
      'Fantasy',
      'Drama'
    ];
    // trending movies
    List<MovieModel> trendingMovies = [];
    for (var el in trendingMoviesData) {
      trendingMovies.add(MovieModel.fromJson(el));
    }
    // popular movies
    List<MovieModel> popularMovies = [];
    for (var el in popularMoviesData) {
      popularMovies.add(MovieModel.fromJson(el));
    }

    return Scaffold(
      backgroundColor: const Color(0xff16193c),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.sort,
                    color: Colors.white,
                    size: 30,
                  ),
                  Image(
                    fit: BoxFit.cover,
                    height: 60,
                    image: AssetImage(
                      'assets/images/movie_logo.png',
                    ),
                  ),
                  Icon(
                    Icons.tune,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Trending movies',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(trendingMovies.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image:
                                NetworkImage(trendingMovies[index].imageLink!),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 1, 5, 59)
                                        .withOpacity(0.4),
                                    Color.fromARGB(255, 249, 171, 46)
                                        .withOpacity(0.35),
                                  ],
                                )),
                          ),
                          Positioned(
                            top: 25,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trendingMovies[index].name!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  trendingMovies[index].year!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Category',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(cat.length, (index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: 90,
                      height: 35,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? const Color(0xfffb0177)
                            : const Color(0xff232a58),
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: const [
                          BoxShadow(blurRadius: 0, offset: Offset(-1, -1)),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          cat[index].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Top Rated',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xfffb0177),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(popularMovies.length, (index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      width: 135,
                      height: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image:
                                  NetworkImage(popularMovies[index].imageLink!),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.black.withOpacity(0.2),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xfffb0177),
                                  size: 15,
                                ),
                                Text(
                                  popularMovies[index].rating.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Color(0xff232a58),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20))),
        child: BottomNavigationBar(
          iconSize: 30,
          elevation: 0,
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
