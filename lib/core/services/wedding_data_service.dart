import 'package:wedding_invitation_app/features/wedding/domain/entities/wedding_info.dart';

/// Service for managing wedding data
class WeddingDataService {
  WeddingInfo? _weddingInfo;

  /// Get current wedding info
  WeddingInfo? get weddingInfo => _weddingInfo;

  /// Set wedding info
  void setWeddingInfo(WeddingInfo weddingInfo) {
    _weddingInfo = weddingInfo;
  }

  /// Get sample wedding data
  WeddingInfo getSampleWeddingData() {
    return WeddingInfo(
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
          description:
              'Chúng tôi gặp nhau lần đầu tiên tại một quán cà phê nhỏ ở Hà Nội. Đó là một ngày mùa xuân đẹp trời, và chúng tôi đã trò chuyện suốt cả buổi chiều.',
          date: DateTime(2020, 3, 15),
        ),
        TimelineEvent(
          title: 'Ngày Hẹn Hò Đầu Tiên',
          description:
              'Buổi hẹn hò đầu tiên tại công viên Thống Nhất. Chúng tôi đã đi dạo, uống trà sữa và cùng nhau xem hoàng hôn.',
          date: DateTime(2020, 4, 10),
        ),
        TimelineEvent(
          title: 'Lễ Đính Hôn',
          description:
              'Ngày trọng đại khi chúng tôi chính thức cam kết với nhau trước gia đình hai bên. Đó là một buổi lễ ấm cúng và tràn đầy niềm vui.',
          date: DateTime(2024, 6, 15),
        ),
        TimelineEvent(
          title: 'Chuẩn Bị Đám Cưới',
          description:
              'Những tháng ngày chuẩn bị cho đám cưới thật vất vả nhưng cũng rất hạnh phúc. Chúng tôi đã lựa chọn từng chi tiết nhỏ với tất cả tình yêu.',
          date: DateTime(2025, 8, 1),
        ),
      ],
    );
  }

  /// Clear wedding data
  void clearWeddingData() {
    _weddingInfo = null;
  }
}
