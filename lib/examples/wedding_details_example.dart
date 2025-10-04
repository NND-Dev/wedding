import 'package:flutter/material.dart';
import '../features/wedding/domain/entities/wedding_info.dart';
import '../widgets/wedding_details_section.dart';

/// Example usage of WeddingDetailsSection widget
/// This file demonstrates how to use the WeddingDetailsSection widget with sample data
void main() {
  runApp(const WeddingDetailsExample());
}

class WeddingDetailsExample extends StatelessWidget {
  const WeddingDetailsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample wedding info
    final sampleWeddingInfo = WeddingInfo(
      brideName: 'Trần Thị B',
      groomName: 'Nguyễn Văn A',
      weddingDate: DateTime(2025, 10, 20),
      ceremonyVenue: 'Nhà thờ Lớn Hà Nội',
      ceremonyAddress: '40 Nhà Chung, Hoàn Kiếm, Hà Nội',
      ceremonyTime: '09:00 - 11:00, Chủ Nhật 20/10/2025',
      receptionVenue: 'Trung tâm Tiệc cưới Diamond',
      receptionAddress: '123 Đường Láng, Đống Đa, Hà Nội',
      receptionTime: '18:00 - 21:00, Chủ Nhật 20/10/2025',
      loveStory: 'Câu chuyện tình yêu của chúng tôi...',
      timeline: [],
    );

    return MaterialApp(
      title: 'Wedding Details Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'DancingScript',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          title: const Text('Wedding Details Example'),
          backgroundColor: Colors.pink.shade400,
        ),
        body: SingleChildScrollView(
          child: WeddingDetailsSection(
            weddingInfo: sampleWeddingInfo,
          ),
        ),
      ),
    );
  }
}
