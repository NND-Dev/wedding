# StoryTimelineSection Widget

## Overview
`StoryTimelineSection` is a Flutter widget that displays a vertical timeline of important relationship milestones for a wedding couple. It features animated timeline events with dots, connecting lines, and beautifully formatted dates.

## Features

- ✅ **Vertical Timeline Layout** - Timeline with dots and connecting lines
- ✅ **Timeline Events Display** - Shows TimelineEvent data from WeddingInfo entity
- ✅ **Vietnamese Date Formatting** - DD/MM/YYYY format
- ✅ **Responsive Design** - Adaptive layout for mobile (< 600px) and desktop
- ✅ **Smooth Animations** - Fade-in and slide animations for each timeline item
- ✅ **Wedding Theme** - Uses pink, gold, and cream color scheme
- ✅ **Optional Images** - Support for timeline event images

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import '../features/wedding/domain/entities/wedding_info.dart';
import '../widgets/story_timeline_section.dart';

class MyWeddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = [
      TimelineEvent(
        title: 'Lần Đầu Gặp Gỡ',
        description: 'Chúng tôi gặp nhau lần đầu tiên...',
        date: DateTime(2020, 10, 15),
      ),
      TimelineEvent(
        title: 'Lời Cầu Hôn',
        description: 'Anh đã quỳ gối cầu hôn em...',
        date: DateTime(2023, 6, 20),
        imageUrl: 'https://example.com/proposal.jpg',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: StoryTimelineSection(
          events: events,
        ),
      ),
    );
  }
}
```

### With Custom Padding

```dart
StoryTimelineSection(
  events: myEvents,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
)
```

## Properties

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `events` | `List<TimelineEvent>` | Yes | - | List of timeline events to display |
| `padding` | `EdgeInsets?` | No | Responsive padding | Custom padding for the section |

## Timeline Structure

Each timeline item consists of:

1. **Timeline Dot** - Pink circular dot with glow effect
2. **Connecting Line** - Gradient line between events (pink shades)
3. **Event Date** - Gold-colored date in DD/MM/YYYY format
4. **Event Title** - Bold pink headline text
5. **Event Description** - Gray body text
6. **Optional Image** - Rounded image with error handling

## Color Scheme

- **Pink (`Colors.pink.shade400`)** - Timeline dots, title text
- **Gold (`Color(0xFFFFC107)`)** - Event dates
- **Cream/Pink (`Colors.pink.shade50`)** - Background accents
- **Gray (`Colors.grey.shade700`)** - Description text

## Responsive Behavior

### Mobile (< 600px)
- Horizontal padding: 16px
- Font sizes: smaller (14-18px)
- Full-width images

### Desktop (≥ 600px)
- Horizontal padding: 48px
- Font sizes: larger (16-22px)
- Fixed-width images (300px)

## Animation Details

- **Section Title**: Fade-in + slide from top (600ms)
- **Timeline Dots**: Scale animation (400ms, staggered by 200ms per item)
- **Event Content**: Fade-in + slide from left (500ms, staggered by 200ms per item)
- **Images**: Fade-in + scale (500ms, staggered by 200ms per item)

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animate: ^1.0.0
```

## Design Principles

This widget follows the wedding app's design principles:
- Clean, elegant layout
- Romantic color palette
- Smooth, delightful animations
- Mobile-first responsive design
- Vietnamese language support

## Example Data

See `lib/examples/story_timeline_example.dart` for a complete working example with sample data.

## Notes

- Uses `ListView.builder` for efficient rendering of timeline events
- `NeverScrollableScrollPhysics` allows embedding in parent scroll view
- Images have error handling with fallback placeholder
- All animations use staggered delays for cascading effect
- Date formatting is optimized for Vietnamese locale
