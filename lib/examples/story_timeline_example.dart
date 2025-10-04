import 'package:flutter/material.dart';
import '../features/wedding/domain/entities/wedding_info.dart';
import '../widgets/story_timeline_section.dart';

/// Example usage of StoryTimelineSection widget
/// This file demonstrates how to use the StoryTimelineSection widget with sample data
void main() {
  runApp(const StoryTimelineExample());
}

class StoryTimelineExample extends StatelessWidget {
  const StoryTimelineExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample timeline events
    final sampleEvents = [
      TimelineEvent(
        title: 'Lần Đầu Gặp Gỡ',
        description: 'Chúng tôi gặp nhau lần đầu tiên tại một quán cà phê nhỏ ở Hà Nội. Đó là một buổi chiều mùa thu đẹp trời.',
        date: DateTime(2020, 10, 15),
      ),
      TimelineEvent(
        title: 'Tình Yêu Nảy Nở',
        description: 'Sau những lần gặp gỡ, chúng tôi nhận ra rằng chúng tôi là những người được sinh ra dành cho nhau.',
        date: DateTime(2021, 2, 14),
      ),
      TimelineEvent(
        title: 'Lời Cầu Hôn',
        description: 'Dưới ánh hoàng hôn tại bãi biển, anh đã quỳ gối và cầu hôn em. Đó là khoảnh khắc đẹp nhất trong đời em.',
        date: DateTime(2023, 6, 20),
      ),
      TimelineEvent(
        title: 'Đính Hôn',
        description: 'Lễ đính hôn được tổ chức ấm cúng với sự hiện diện của gia đình hai bên.',
        date: DateTime(2024, 3, 15),
      ),
      TimelineEvent(
        title: 'Hôn Lễ',
        description: 'Ngày trọng đại - chúng tôi chính thức trở thành vợ chồng!',
        date: DateTime(2025, 10, 20),
      ),
    ];

    return MaterialApp(
      title: 'Story Timeline Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'DancingScript',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          title: const Text('Story Timeline Example'),
          backgroundColor: Colors.pink.shade400,
        ),
        body: SingleChildScrollView(
          child: StoryTimelineSection(
            events: sampleEvents,
          ),
        ),
      ),
    );
  }
}
