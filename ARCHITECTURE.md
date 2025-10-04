# StoryTimelineSection Widget Architecture

## Component Hierarchy

```
StoryTimelineSection (StatelessWidget)
│
├── Container (with responsive padding)
│   └── Column
│       ├── Text (Section Title: "Câu Chuyện Tình Yêu")
│       │   └── .animate().fadeIn().slideY()
│       │
│       ├── SizedBox (32px spacing)
│       │
│       └── ListView.builder (Timeline Events)
│           └── _TimelineItem (for each event)
│               └── IntrinsicHeight
│                   └── Row
│                       ├── SizedBox (40px width - Timeline Column)
│                       │   └── Column
│                       │       ├── Expanded (Top Line - if !isFirst)
│                       │       │   └── Container (2px gradient line)
│                       │       │
│                       │       ├── Container (Timeline Dot)
│                       │       │   └── .animate().scale()
│                       │       │       └── 16x16 Circle
│                       │       │           ├── Pink fill
│                       │       │           ├── Border (3px)
│                       │       │           └── BoxShadow (glow)
│                       │       │
│                       │       └── Expanded (Bottom Line - if !isLast)
│                       │           └── Container (2px gradient line)
│                       │
│                       ├── SizedBox (16px spacing)
│                       │
│                       └── Expanded (Event Content)
│                           └── Padding
│                               └── Column
│                                   ├── Text (Date - Gold)
│                                   │   └── .animate().fadeIn().slideX()
│                                   │
│                                   ├── SizedBox (8px)
│                                   │
│                                   ├── Text (Title - Pink)
│                                   │   └── .animate().fadeIn().slideX()
│                                   │
│                                   ├── SizedBox (8px)
│                                   │
│                                   ├── Text (Description - Gray)
│                                   │   └── .animate().fadeIn().slideX()
│                                   │
│                                   └── ClipRRect (Optional Image)
│                                       └── .animate().fadeIn().scale()
│                                           └── Image.network
│                                               └── errorBuilder (fallback)
```

## Data Flow

```
TimelineEvent (from WeddingInfo entity)
│
├── title: String
├── description: String
├── date: DateTime
└── imageUrl: String? (optional)
    │
    ↓
StoryTimelineSection
    │
    ├── events: List<TimelineEvent>
    └── padding: EdgeInsets? (optional)
        │
        ↓
    _TimelineItem (for each event)
        │
        ├── Formats date → DD/MM/YYYY
        ├── Determines position → isFirst, isLast
        ├── Calculates responsive sizes → isMobile
        └── Applies animations → staggered delays
            │
            ↓
        Rendered Timeline UI
```

## Animation Timeline

```
Time (ms)    Component           Animation Type
───────────────────────────────────────────────────
   0         Widget loads        -
 300         Title               fadeIn + slideY (600ms)
 300+0*200   Event[0] Dot        scale (400ms)
 400+0*200   Event[0] Date       fadeIn + slideX (500ms)
 500+0*200   Event[0] Title      fadeIn + slideX (500ms)
 600+0*200   Event[0] Desc       fadeIn + slideX (500ms)
 700+0*200   Event[0] Image      fadeIn + scale (500ms)
 300+1*200   Event[1] Dot        scale (400ms)
 400+1*200   Event[1] Date       fadeIn + slideX (500ms)
 500+1*200   Event[1] Title      fadeIn + slideX (500ms)
 600+1*200   Event[1] Desc       fadeIn + slideX (500ms)
 700+1*200   Event[1] Image      fadeIn + scale (500ms)
   ...       [continues for each event with 200ms stagger]
```

## Responsive Breakpoints

```
Screen Width     Layout Type     Settings
──────────────────────────────────────────────────────
< 600px          Mobile          ├── Padding: 16px horizontal
                                 ├── Fonts: 14-18px
                                 └── Images: Full width

≥ 600px          Desktop         ├── Padding: 48px horizontal
                                 ├── Fonts: 16-22px
                                 └── Images: 300px fixed width
```

## Color Palette

```
Component              Color                    Hex Code
──────────────────────────────────────────────────────────
Timeline Dot           Pink (shade 400)         #EC407A
Dot Border             Pink (shade 100)         #F8BBD0
Dot Shadow             Pink (shade 200, 50%)    #F48FB1 + opacity
Gradient Lines         Pink (300-400)           #F06292 → #EC407A
Event Date             Gold                     #FFC107
Event Title            Pink (shade 700)         #C2185B
Event Description      Gray (shade 700)         #616161
Section Title          Pink (shade 700)         #C2185B
Image Placeholder      Pink (shade 50)          #FCE4EC
Background (example)   Pink (shade 50)          #FCE4EC
```

## Layout Measurements

```
Timeline Column:
├── Width: 40px
├── Dot Size: 16x16px
├── Dot Border: 3px
├── Line Width: 2px
└── Gap to Content: 16px

Spacing:
├── Section Title to Timeline: 32px
├── Between Events: 32px
├── Date to Title: 8px
├── Title to Description: 8px
└── Description to Image: 12px

Images:
├── Border Radius: 12px
├── Mobile Height: 200px
├── Desktop Width: 300px
└── Desktop Height: 250px
```

## Key Features Implementation

### 1. Timeline Line Logic
```
For each timeline item:
  IF index != 0:
    Show top connecting line (Expanded widget)
  
  Show timeline dot (16x16 circle)
  
  IF index != last:
    Show bottom connecting line (Expanded widget)
```

### 2. Date Formatting
```dart
// Vietnamese format: DD/MM/YYYY
date.day (padLeft 2, '0') + '/' + 
date.month (padLeft 2, '0') + '/' + 
date.year

Example: DateTime(2020, 3, 5) → "05/03/2020"
```

### 3. Responsive Detection
```dart
final isMobile = MediaQuery.of(context).size.width < 600;

// Used for:
- Padding: isMobile ? 16 : 48
- Font sizes: isMobile ? 14 : 16
- Image width: isMobile ? double.infinity : 300
```

### 4. Animation Staggering
```dart
delay: (baseDelay + index * 200).ms

Component delays:
- Dot: 300ms + (index * 200ms)
- Date: 400ms + (index * 200ms)
- Title: 500ms + (index * 200ms)
- Description: 600ms + (index * 200ms)
- Image: 700ms + (index * 200ms)

Result: Cascading animation from top to bottom
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animate: ^1.0.0  # For smooth animations
  equatable: ^2.0.0        # Used by TimelineEvent entity
```

## Usage Pattern

```dart
// 1. Import the widget
import 'package:flutter/material.dart';
import '../features/wedding/domain/entities/wedding_info.dart';
import '../widgets/story_timeline_section.dart';

// 2. Prepare timeline events
final events = [
  TimelineEvent(
    title: 'First Meeting',
    description: 'We met at...',
    date: DateTime(2020, 10, 15),
  ),
  // ... more events
];

// 3. Use in widget tree
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: StoryTimelineSection(
        events: events,
        padding: EdgeInsets.all(24), // Optional
      ),
    ),
  );
}
```

## Performance Optimizations

1. **ListView.builder**: Only builds visible items
2. **shrinkWrap: true**: Allows embedding in parent ScrollView
3. **NeverScrollableScrollPhysics**: Prevents nested scrolling issues
4. **const constructors**: Reduces rebuilds
5. **IntrinsicHeight**: Ensures proper timeline line heights
6. **Conditional rendering**: Only shows image if imageUrl exists

## Error Handling

1. **Image Loading**: 
   - errorBuilder provides fallback UI
   - Shows pink placeholder with icon
   - Maintains layout structure

2. **Null Safety**:
   - imageUrl is nullable (String?)
   - Conditional rendering with `if (event.imageUrl != null)`
   - Safe access with `event.imageUrl!`

3. **Empty List**:
   - ListView.builder handles empty list gracefully
   - Returns empty list without errors
