import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YosemitePager(),
    );
  }
}

class YosemitePager extends StatefulWidget {
  const YosemitePager({super.key});

  @override
  State<YosemitePager> createState() => _YosemitePagerState();
}

class _YosemitePagerState extends State<YosemitePager> {
  final PageController _pageController = PageController();

  final List<String> imageUrls = [
    'https://raw.githubusercontent.com/RobertoGaytanM8/imagenes-ios/refs/heads/main/perritopng.png',
    'https://raw.githubusercontent.com/RobertoGaytanM8/imagenes-ios/refs/heads/main/perritopng2.png',
    'https://raw.githubusercontent.com/RobertoGaytanM8/imagenes-ios/refs/heads/main/perritopng3.jpg',
    'https://raw.githubusercontent.com/RobertoGaytanM8/imagenes-ios/refs/heads/main/perritopng4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return YosemitePage(
            imageUrl: imageUrls[index],
            pageIndex: index + 1,
            totalPages: imageUrls.length,
          );
        },
      ),
    );
  }
}

class YosemitePage extends StatelessWidget {
  final String imageUrl;
  final int pageIndex;
  final int totalPages;

  const YosemitePage({
    super.key,
    required this.imageUrl,
    required this.pageIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        SizedBox.expand(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
                Colors.black.withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.4, 1.0],
            ),
          ),
        ),

        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Page Counter
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '$pageIndex/$totalPages',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),

                // Fade + Slide-in content
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Refugio\nCanino',
                        style: TextStyle(
                          color: Color.fromARGB(255, 201, 255, 247),
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              );
                            }),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '4.0',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '(2300)',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscig elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'READ MORE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
