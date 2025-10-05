import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../features/wedding/domain/entities/wedding_info.dart';

/// Widget hiển thị thông tin chi tiết về lễ cưới và tiệc cưới
/// Bao gồm thông tin về thời gian, địa điểm, và các nút tương tác
class WeddingDetailsSection extends StatelessWidget {
  final WeddingInfo weddingInfo;
  final EdgeInsets? padding;

  const WeddingDetailsSection({
    Key? key,
    required this.weddingInfo,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Center(
            child: Text(
              'Thông Tin Lễ Cưới',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.pink.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Ceremony Card
          _EventCard(
            title: 'Lễ Gia Tiên',
            icon: Icons.church,
            time: weddingInfo.ceremonyTime,
            venue: weddingInfo.ceremonyVenue,
            address: weddingInfo.ceremonyAddress,
            isMobile: isMobile,
          ),

          const SizedBox(height: 24),

          // Reception Card
          _EventCard(
            title: 'Tiệc Cưới',
            icon: Icons.celebration,
            time: weddingInfo.receptionTime,
            venue: weddingInfo.receptionVenue,
            address: weddingInfo.receptionAddress,
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }
}

/// Widget card cho từng sự kiện (ceremony hoặc reception)
class _EventCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String time;
  final String venue;
  final String address;
  final bool isMobile;

  const _EventCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.time,
    required this.venue,
    required this.address,
    required this.isMobile,
  }) : super(key: key);

  Future<void> _openDirections(BuildContext context) async {
    // Encode address for URL
    final encodedAddress = Uri.encodeComponent(address);
    final googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    final appleMapsUrl = 'https://maps.apple.com/?q=$encodedAddress';

    // Try to open Google Maps URL
    final uri = Uri.parse(googleMapsUrl);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // If Google Maps can't be opened, try Apple Maps
        final appleUri = Uri.parse(appleMapsUrl);
        if (await canLaunchUrl(appleUri)) {
          await launchUrl(appleUri, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Không thể mở ứng dụng bản đồ'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _copyAddress(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: address));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Đã sao chép địa chỉ vào clipboard'),
            ],
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink.shade50.withValues(alpha: 0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Title with Icon
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade400,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.shade200.withValues(alpha: 0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: isMobile ? 24 : 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.pink.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 20 : 24,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Time Information
              _InfoRow(
                icon: Icons.access_time,
                label: 'Thời gian',
                value: time,
                isMobile: isMobile,
              ),

              const SizedBox(height: 16),

              // Venue Information
              _InfoRow(
                icon: Icons.location_city,
                label: 'Địa điểm',
                value: venue,
                isMobile: isMobile,
              ),

              const SizedBox(height: 16),

              // Address Information
              _InfoRow(
                icon: Icons.place,
                label: 'Địa chỉ',
                value: address,
                isMobile: isMobile,
              ),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _openDirections(context),
                      icon: const Icon(Icons.directions),
                      label: const Text('Chỉ đường'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade400,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 12 : 16,
                          horizontal: isMobile ? 12 : 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _copyAddress(context),
                      icon: const Icon(Icons.content_copy),
                      label: const Text('Sao chép'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.pink.shade400,
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 12 : 16,
                          horizontal: isMobile ? 12 : 20,
                        ),
                        side: BorderSide(color: Colors.pink.shade400, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget hiển thị một hàng thông tin với icon
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isMobile;

  const _InfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107).withValues(alpha: 0.2), // Gold color
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFFFC107), // Gold color
            size: isMobile ? 20 : 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade800,
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
