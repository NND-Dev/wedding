import 'package:wedding_invitation_app/features/wedding/domain/entities/wedding_info.dart';

/// Abstract data source for wedding local data
abstract class WeddingLocalDataSource {
  /// Get wedding info from local storage
  Future<WeddingInfo> getWeddingInfo();

  /// Cache wedding info to local storage
  Future<void> cacheWeddingInfo(WeddingInfo weddingInfo);
}

/// Implementation of wedding local data source
class WeddingLocalDataSourceImpl implements WeddingLocalDataSource {
  @override
  Future<WeddingInfo> getWeddingInfo() async {
    // In production, get from SharedPreferences, SQLite, Hive, etc.
    // For now, return sample data
    return _getSampleWeddingInfo();
  }

  @override
  Future<void> cacheWeddingInfo(WeddingInfo weddingInfo) async {
    // In production, save to SharedPreferences, SQLite, Hive, etc.
    await Future.delayed(const Duration(milliseconds: 100));
  }

  WeddingInfo _getSampleWeddingInfo() {
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
              'Chúng tôi gặp nhau lần đầu tiên tại một quán cà phê nhỏ ở Hà Nội.',
          date: DateTime(2020, 3, 15),
        ),
        TimelineEvent(
          title: 'Ngày Hẹn Hò Đầu Tiên',
          description: 'Buổi hẹn hò đầu tiên tại công viên Thống Nhất.',
          date: DateTime(2020, 4, 10),
        ),
        TimelineEvent(
          title: 'Lễ Đính Hôn',
          description:
              'Ngày trọng đại khi chúng tôi chính thức cam kết với nhau.',
          date: DateTime(2024, 6, 15),
        ),
        TimelineEvent(
          title: 'Chuẩn Bị Đám Cưới',
          description: 'Những tháng ngày chuẩn bị cho đám cưới.',
          date: DateTime(2025, 8, 1),
        ),
      ],
    );
  }
}
