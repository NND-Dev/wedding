import 'package:flutter/material.dart';
import '../widgets/gallery_section.dart';

/// Example demonstrating how to use the GallerySection widget
class GalleryExample extends StatelessWidget {
  const GalleryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample gallery images
    final galleryImages = [
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=1',
        category: 'Pre-wedding',
        caption: 'Khoảnh khắc ngọt ngào trước hôn lễ',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=2',
        category: 'Pre-wedding',
        caption: 'Chụp ảnh cưới tại công viên',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=3',
        category: 'Engagement',
        caption: 'Lễ đính hôn ấm cúng',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=4',
        category: 'Engagement',
        caption: 'Trao nhẫn đính hôn',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=5',
        category: 'Family',
        caption: 'Gia đình hai bên',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=6',
        category: 'Family',
        caption: 'Bữa cơm gia đình',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=7',
        category: 'Pre-wedding',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=8',
        category: 'Engagement',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=9',
        category: 'Family',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=10',
        category: 'Pre-wedding',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=11',
        category: 'Engagement',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=12',
        category: 'Family',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Example'),
        backgroundColor: Colors.pink.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section placeholder
            Container(
              height: 200,
              color: Colors.pink.shade50,
              child: Center(
                child: Text(
                  'Wedding Invitation Header',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.pink.shade700,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
            ),
            
            // Gallery Section
            GallerySection(
              images: galleryImages,
              title: 'Album Ảnh Cưới',
            ),
            
            // Footer placeholder
            Container(
              height: 100,
              color: Colors.pink.shade50,
              child: const Center(
                child: Text('Footer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Example with custom padding and no title
class GalleryExampleCustom extends StatelessWidget {
  const GalleryExampleCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final galleryImages = [
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=1',
        category: 'Pre-wedding',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=2',
        category: 'Engagement',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=3',
        category: 'Family',
      ),
      const GalleryImage(
        imageUrl: 'https://picsum.photos/400/400?random=4',
        category: 'Pre-wedding',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Gallery Example'),
        backgroundColor: Colors.pink.shade700,
      ),
      body: SingleChildScrollView(
        child: GallerySection(
          images: galleryImages,
          padding: const EdgeInsets.all(24),
          // No title - just grid
        ),
      ),
    );
  }
}

// To run this example, update main.dart:
// 
// import 'package:flutter/material.dart';
// import 'lib/examples/gallery_example.dart';
// 
// void main() {
//   runApp(const MyApp());
// }
// 
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wedding Gallery',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         fontFamily: 'DancingScript',
//       ),
//       home: const GalleryExample(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
