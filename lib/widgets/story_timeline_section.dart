import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../features/wedding/domain/entities/wedding_info.dart';

class StoryTimelineSection extends StatelessWidget {
  final List<TimelineEvent> events;
  final EdgeInsets? padding;

  const StoryTimelineSection({Key? key, required this.events, this.padding})
    : super(key: key);

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
          Text(
                'Câu Chuyện Tình Yêu',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.pink.shade700,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript',
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms)
              .slide(begin: const Offset(0, -0.3), end: Offset.zero),

          const SizedBox(height: 32),

          // Timeline Events
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return _TimelineItem(
                event: events[index],
                isFirst: index == 0,
                isLast: index == events.length - 1,
                index: index,
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final TimelineEvent event;
  final bool isFirst;
  final bool isLast;
  final int index;
  final bool isMobile;

  const _TimelineItem({
    Key? key,
    required this.event,
    required this.isFirst,
    required this.isLast,
    required this.index,
    required this.isMobile,
  }) : super(key: key);

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Dot and Line
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Top Line
                if (!isFirst)
                  Expanded(
                    child: Container(
                      width: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink.shade300, Colors.pink.shade400],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 0),

                // Dot
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink.shade400,
                    border: Border.all(color: Colors.pink.shade100, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.shade200.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ).animate().scale(
                  delay: (300 + index * 200).ms,
                  duration: 400.ms,
                ),

                // Bottom Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink.shade400, Colors.pink.shade300],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 0),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Event Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Date
                  Text(
                        _formatDate(event.date),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFFFFC107), // Gold color
                          fontWeight: FontWeight.w600,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      )
                      .animate()
                      .fadeIn(delay: (400 + index * 200).ms, duration: 500.ms)
                      .slide(begin: const Offset(-0.2, 0), end: Offset.zero),

                  const SizedBox(height: 8),

                  // Event Title
                  Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.pink.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 18 : 22,
                        ),
                      )
                      .animate()
                      .fadeIn(delay: (500 + index * 200).ms, duration: 500.ms)
                      .slide(begin: const Offset(-0.2, 0), end: Offset.zero),

                  const SizedBox(height: 8),

                  // Event Description
                  Text(
                        event.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                          height: 1.5,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      )
                      .animate()
                      .fadeIn(delay: (600 + index * 200).ms, duration: 500.ms)
                      .slide(begin: const Offset(-0.2, 0), end: Offset.zero),

                  // Optional Image
                  if (event.imageUrl != null) ...[
                    const SizedBox(height: 12),
                    ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            event.imageUrl!,
                            width: isMobile ? double.infinity : 300,
                            height: isMobile ? 200 : 250,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: isMobile ? double.infinity : 300,
                                height: isMobile ? 200 : 250,
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.pink.shade200,
                                  size: 48,
                                ),
                              );
                            },
                          ),
                        )
                        .animate()
                        .fadeIn(delay: (700 + index * 200).ms, duration: 500.ms)
                        .scale(
                          begin: const Offset(0.9, 0.9),
                          end: const Offset(1, 1),
                        ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
