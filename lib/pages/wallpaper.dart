import 'package:flutter/material.dart';

class WallpaperPage extends StatelessWidget {
  final List<String> wallpaperUrls = [
    'assets/day1.jpg',
    'assets/day2.jpg',
    'assets/day3.jpg',
    // Add more wallpaper URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: wallpaperUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return WallpaperItem(url: wallpaperUrls[index]);
        },
      ),
    );
  }
}

class WallpaperItem extends StatelessWidget {
  final String url;

  WallpaperItem({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height, // Adjust the height to cover the screen
      child: Stack(
        children: [
          Image.asset(
            url,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Apply the wallpaper in the background
                // Add your implementation here
              },
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
