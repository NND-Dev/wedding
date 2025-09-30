import 'package:flutter/material.dart';

void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wedding Invitation',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'DancingScript',
      ),
      home: const InvitationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder: Sẽ thay thế bằng animation mở thiệp và các block nội dung
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Card(
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Thiệp Mời Cưới', style: TextStyle(fontFamily: 'DancingScript', fontSize: 36, color: Colors.pink)),
                const SizedBox(height: 16),
                Text('Nguyễn Văn A & Trần Thị B', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Trân trọng kính mời bạn đến dự lễ cưới của chúng tôi', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text('Thời gian: 18:00, 20/10/2025', style: TextStyle(color: Colors.grey[700])),
                Text('Địa điểm: Trung tâm tiệc cưới Diamond, Hà Nội', style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 24),
                Placeholder(fallbackHeight: 120, fallbackWidth: 120), // Placeholder cho QR code
                const SizedBox(height: 24),
                Text('Quét QR code để xác nhận tham dự hoặc gửi lời chúc!', style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}