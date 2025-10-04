import 'package:flutter/material.dart';
import '../features/wedding/domain/entities/gallery_image.dart';
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
      const GalleryImage(
        id: '1',
        imageUrl: 'https://picsum.photos/400/400?random=1',
        category: 'Pre-wedding',
        title: 'Chụp ảnh cưới tại biển',
        description: 'Những khoảnh khắc tuyệt vời tại bãi biển',
      ),
      const GalleryImage(
        id: '2',
        imageUrl: 'https://picsum.photos/400/400?random=2',
        category: 'Pre-wedding',
        title: 'Vườn hoa mùa xuân',
        description: 'Giữa vườn hoa rực rỡ',
      ),
      const GalleryImage(
        id: '3',
        imageUrl: 'https://picsum.photos/400/400?random=3',
        category: 'Engagement',
        title: 'Lễ đính hôn',
        description: 'Ngày trọng đại của chúng tôi',
      ),
      const GalleryImage(
        id: '4',
        imageUrl: 'https://picsum.photos/400/400?random=4',
        category: 'Engagement',
      ),
      const GalleryImage(
        id: '5',
        imageUrl: 'https://picsum.photos/400/400?random=5',
        category: 'Pre-wedding',
        title: 'Hoàng hôn lãng mạn',
      ),
      const GalleryImage(
        id: '6',
        imageUrl: 'https://picsum.photos/400/400?random=6',
        category: 'Family',
        title: 'Gia đình hai bên',
        description: 'Hạnh phúc sum họp',
      ),
      const GalleryImage(
        id: '7',
        imageUrl: 'https://picsum.photos/400/400?random=7',
        category: 'Pre-wedding',
      ),
      const GalleryImage(
        id: '8',
        imageUrl: 'https://picsum.photos/400/400?random=8',
        category: 'Pre-wedding',
        title: 'Trong công viên',
      ),
      const GalleryImage(
        id: '9',
        imageUrl: 'https://picsum.photos/400/400?random=9',
        category: 'Family',
      ),
      const GalleryImage(
        id: '10',
        imageUrl: 'https://picsum.photos/400/400?random=10',
        category: 'Engagement',
        title: 'Nhẫn cưới',
        description: 'Biểu tượng của tình yêu vĩnh cửu',
      ),
      const GalleryImage(
        id: '11',
        imageUrl: 'https://picsum.photos/400/400?random=11',
        category: 'Pre-wedding',
      ),
      const GalleryImage(
        id: '12',
        imageUrl: 'https://picsum.photos/400/400?random=12',
        category: 'Pre-wedding',
        title: 'Studio chụp ảnh',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Album Ảnh Cưới'),
        backgroundColor: Colors.pink.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            GallerySection(
              images: sampleImages,
              title: 'Khoảnh Khắc Đáng Nhớ',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
