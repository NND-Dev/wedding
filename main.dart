import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import all section widgets
import 'package:wedding_invitation_app/widgets/hero_section.dart';
import 'package:wedding_invitation_app/widgets/story_timeline_section.dart';
import 'package:wedding_invitation_app/widgets/wedding_details_section.dart';
import 'package:wedding_invitation_app/widgets/gallery_section.dart';
import 'package:wedding_invitation_app/widgets/message_section.dart';

// Import domain entities
import 'package:wedding_invitation_app/features/wedding/domain/entities/wedding_info.dart';

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
        fontFamily: 'Roboto',
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const InvitationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final ScrollController _scrollController = ScrollController();
  
  // Sample wedding data
  final WeddingInfo _weddingInfo = const WeddingInfo(
    brideName: 'Trần Thị B',
    groomName: 'Nguyễn Văn A',
    weddingDate: DateTime(2025, 10, 20),
    ceremonyVenue: 'Nhà hàng Diamond',
    ceremonyAddress: '123 Đường Láng, Đống Đa, Hà Nội',
    ceremonyTime: '09:00 AM, Thứ Bảy, 20/10/2025',
    receptionVenue: 'Trung tâm Tiệc cưới Diamond',
    receptionAddress: '123 Đường Láng, Đống Đa, Hà Nội',
    receptionTime: '18:00 PM, Thứ Bảy, 20/10/2025',
    loveStory: 'Chúng tôi gặp nhau vào một ngày mùa xuân...',
    timeline: [
      TimelineEvent(
        title: 'Lần Đầu Gặp Mặt',
        description: 'Chúng tôi gặp nhau lần đầu tiên tại một quán cà phê nhỏ ở Hà Nội. Đó là một ngày mùa xuân đẹp trời, và chúng tôi đã trò chuyện suốt cả buổi chiều.',
        date: DateTime(2020, 3, 15),
      ),
      TimelineEvent(
        title: 'Ngày Hẹn Hò Đầu Tiên',
        description: 'Buổi hẹn hò đầu tiên tại công viên Thống Nhất. Chúng tôi đã đi dạo, uống trà sữa và cùng nhau xem hoàng hôn.',
        date: DateTime(2020, 4, 10),
      ),
      TimelineEvent(
        title: 'Lễ Đính Hôn',
        description: 'Ngày trọng đại khi chúng tôi chính thức cam kết với nhau trước gia đình hai bên. Đó là một buổi lễ ấm cúng và tràn đầy niềm vui.',
        date: DateTime(2024, 6, 15),
      ),
      TimelineEvent(
        title: 'Chuẩn Bị Đám Cưới',
        description: 'Những tháng ngày chuẩn bị cho đám cưới thật vất vả nhưng cũng rất hạnh phúc. Chúng tôi đã lựa chọn từng chi tiết nhỏ với tất cả tình yêu.',
        date: DateTime(2025, 8, 1),
      ),
    ],
  );

  // Sample gallery images
  final List<GalleryImage> _galleryImages = const [
    GalleryImage(
      url: 'https://images.unsplash.com/photo-1519741497674-611481863552?w=800',
      category: 'Pre-wedding',
      title: 'Pre-wedding shoot',
      description: 'Bộ ảnh cưới của chúng tôi',
    ),
    GalleryImage(
      url: 'https://images.unsplash.com/photo-1606216794074-735e91aa2c92?w=800',
      category: 'Pre-wedding',
      title: 'Romantic moments',
    ),
    GalleryImage(
      url: 'https://images.unsplash.com/photo-1591604466107-ec97de577aff?w=800',
      category: 'Đính hôn',
      title: 'Engagement ceremony',
      description: 'Lễ đính hôn ấm cúng',
    ),
    GalleryImage(
      url: 'https://images.unsplash.com/photo-1583939003579-730e3918a45a?w=800',
      category: 'Gia đình',
      title: 'Family gathering',
    ),
    GalleryImage(
      url: 'https://images.unsplash.com/photo-1573495627361-d9b87960b12d?w=800',
      category: 'Pre-wedding',
      title: 'Love in the air',
    ),
    GalleryImage(
      url: 'https://images.unsplash.com/photo-1522673607200-164d1b6ce486?w=800',
      category: 'Gia đình',
      title: 'With family',
      description: 'Gia đình là điều quan trọng nhất',
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleMessageSubmit(String name, String message) {
    // In production, this would send data to a backend
    print('Message from $name: $message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // 1. Hero Section - Opening animation
            HeroSection(
              brideName: _weddingInfo.brideName,
              groomName: _weddingInfo.groomName,
              weddingDate: _weddingInfo.weddingDate,
            ),

            // Divider
            Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.pink.shade200,
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 2. Story Timeline Section
            StoryTimelineSection(
              events: _weddingInfo.timeline,
            ),

            // Divider
            Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.pink.shade200,
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 3. Wedding Details Section
            WeddingDetailsSection(
              weddingInfo: _weddingInfo,
            ),

            // Divider
            Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.pink.shade200,
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 4. Gallery Section
            GallerySection(
              images: _galleryImages,
            ),

            // Divider
            Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.pink.shade200,
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // 5. Message Section
            MessageSection(
              bankingQRData: 'https://example.com/banking-qr',
              bankAccountInfo: 'MB Bank - 0123456789\nNGUYỄN VĂN A',
              onMessageSubmit: _handleMessageSubmit,
            ),

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade50,
                    Colors.pink.shade100,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '❤️',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Cảm ơn bạn đã đến chung vui cùng chúng tôi!',
                    style: GoogleFonts.dancingScript(
                      fontSize: 24,
                      color: Colors.pink.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_weddingInfo.brideName} & ${_weddingInfo.groomName}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.pink.shade600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '© 2025 Wedding Invitation',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Floating action button for scroll to top
      floatingActionButton: _buildScrollToTopButton(),
    );
  }

  Widget _buildScrollToTopButton() {
    return FloatingActionButton(
      onPressed: () {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      },
      backgroundColor: Colors.pink.shade400,
      child: const Icon(Icons.arrow_upward, color: Colors.white),
    );
  }
}