import 'package:flutter/material.dart';

final dummy = [
  'cat.jpg',
  'cat2.webp',
  'cat3.webp',
  'flutter.png',
  'dash.png',
  'dash2.png',
  'dash3.png'
].map((fileName) => 'assets/images/$fileName').toList();

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({
    super.key,
    required this.url,
    required this.tag,
  });

  final String url;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Detail')),
      body: Center(
        child: PhotoHero(
          url: url,
          tag: tag,
          size: 300,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class PhotoListPage extends StatelessWidget {
  const PhotoListPage({
    super.key,
    required this.photoUrls,
  });

  final List<String> photoUrls;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo List')),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: photoUrls.length,
          itemBuilder: (BuildContext context, int index) {
            var url = photoUrls[index];
            var tag = '$index';
            return PhotoHero(
              url: url,
              tag: tag,
              size: 100,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailPage(url: url, tag: tag),
                  ),
                );
              },
            );
          }),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.url,
    required this.tag,
    required this.onTap,
    required this.size,
  });

  final String url;
  final String tag;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
