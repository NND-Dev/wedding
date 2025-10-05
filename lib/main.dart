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

// Import dependency injection
import 'package:wedding_invitation_app/core/di/service_locator.dart';
import 'package:wedding_invitation_app/core/services/wedding_data_service.dart';
import 'package:wedding_invitation_app/core/services/gallery_service.dart';
import 'package:wedding_invitation_app/core/services/message_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependency injection
  await sl.setupDependencies();

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

  // Get services from dependency injection
  late final WeddingInfo _weddingInfo;
  late final List<GalleryImage> _galleryImages;

  @override
  void initState() {
    super.initState();
    // Initialize data from services
    final weddingDataService = sl.get<WeddingDataService>();
    final galleryService = sl.get<GalleryService>();

    _weddingInfo = weddingDataService.getSampleWeddingData();
    _galleryImages = galleryService.getSampleGalleryData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _handleMessageSubmit(String name, String message) async {
    final messageService = sl.get<MessageService>();
    final success = await messageService.addMessage(name, message);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cảm ơn bạn đã gửi lời chúc!'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Có lỗi xảy ra, vui lòng thử lại!'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
            StoryTimelineSection(events: _weddingInfo.timeline),

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
            WeddingDetailsSection(weddingInfo: _weddingInfo),

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
            GallerySection(images: _galleryImages),

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
                  colors: [Colors.pink.shade50, Colors.pink.shade100],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const Text('❤️', style: TextStyle(fontSize: 32)),
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
