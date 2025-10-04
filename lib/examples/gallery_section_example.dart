import 'package:flutter/material.dart';
import '../widgets/gallery_section.dart';

void main() {
  runApp(const GalleryExampleApp());
}

class GalleryExampleApp extends StatelessWidget {
  const GalleryExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Section Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'DancingScript',
      ),
      home: const GalleryExamplePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GalleryExamplePage extends StatelessWidget {
  const GalleryExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample gallery images
    final sampleImages = [
      // Pre-wedding photos
      const GalleryImage(
        url: 'https://picsum.photos/seed/prewedding1/800/800',
        category: 'Pre-wedding',
        title: 'Hoàng hôn biển',
        description: 'Chụp tại bãi biển Đà Nẵng',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/prewedding2/800/800',
        category: 'Pre-wedding',
        title: 'Công viên mùa thu',
        description: 'Mùa lá vàng rơi',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/prewedding3/800/800',
        category: 'Pre-wedding',
        title: 'Phố cổ Hội An',
        description: 'Đêm đèn lồng rực rỡ',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/prewedding4/800/800',
        category: 'Pre-wedding',
      ),

      // Engagement photos
      const GalleryImage(
        url: 'https://picsum.photos/seed/engagement1/800/800',
        category: 'Đính hôn',
        title: 'Lễ đính hôn',
        description: 'Ngày vui của hai gia đình',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/engagement2/800/800',
        category: 'Đính hôn',
        title: 'Trao nhẫn',
        description: 'Khoảnh khắc thiêng liêng',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/engagement3/800/800',
        category: 'Đính hôn',
      ),

      // Family photos
      const GalleryImage(
        url: 'https://picsum.photos/seed/family1/800/800',
        category: 'Gia đình',
        title: 'Gia đình hai bên',
        description: 'Một gia đình mới được hình thành',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/family2/800/800',
        category: 'Gia đình',
        title: 'Bố mẹ hai bên',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/family3/800/800',
        category: 'Gia đình',
      ),

      // More pre-wedding
      const GalleryImage(
        url: 'https://picsum.photos/seed/prewedding5/800/800',
        category: 'Pre-wedding',
      ),
      const GalleryImage(
        url: 'https://picsum.photos/seed/prewedding6/800/800',
        category: 'Pre-wedding',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Gallery Section Demo'),
        backgroundColor: Colors.pink.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            
            // Gallery Section Widget
            GallerySection(
              images: sampleImages,
            ),
            
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
