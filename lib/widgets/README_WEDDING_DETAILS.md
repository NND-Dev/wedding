# WeddingDetailsSection Widget - Complete Documentation

## 📋 Overview

The **WeddingDetailsSection** widget displays detailed information about wedding ceremony and reception events. It provides an elegant card-based layout with interactive features for directions and address copying.

## ✨ Features

- **Ceremony & Reception Cards** - Two beautiful cards displaying event details
- **Interactive Maps Integration** - "Chỉ đường" button opens Google Maps/Apple Maps
- **Address Copy Functionality** - "Sao chép" button copies address to clipboard
- **SnackBar Feedback** - Visual confirmation when address is copied
- **Wedding Theme** - Pink, gold, and cream color scheme
- **Responsive Design** - Adapts to mobile and desktop screen sizes
- **Elegant UI** - Card elevation, rounded corners, gradient backgrounds

## 🎨 Visual Design

### Color Scheme
| Element | Color | Hex Code |
|---------|-------|----------|
| Primary (Buttons) | Pink 400 | `#EC407A` |
| Title Text | Pink 700 | `#C2185B` |
| Icons Accent | Gold | `#FFC107` |
| Card Background | White to Pink 50 | Gradient |
| Success Message | Green | `Colors.green` |
| Error Message | Red | `Colors.red` |

### Typography
- **Section Title**: DancingScript, headlineMedium, Pink 700
- **Event Title**: Bold, titleLarge (20-24px)
- **Info Labels**: bodySmall, Gray 600 (12-14px)
- **Info Values**: bodyMedium, Gray 800 (14-16px), w600

## 📱 Responsive Breakpoints

### Mobile (< 600px)
- Padding: 16px horizontal, 32px vertical
- Icon size: 24px
- Button padding: 12px vertical
- Font sizes: 12-20px

### Desktop (≥ 600px)
- Padding: 48px horizontal, 32px vertical
- Icon size: 28px
- Button padding: 16px vertical
- Font sizes: 14-24px

## 🔧 API Reference

### WeddingDetailsSection

Main widget that displays ceremony and reception information.

#### Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `weddingInfo` | `WeddingInfo` | Yes | Wedding information containing ceremony and reception details |
| `padding` | `EdgeInsets?` | No | Custom padding (defaults to responsive padding) |

#### Usage Example

```dart
import 'package:flutter/material.dart';
import '../features/wedding/domain/entities/wedding_info.dart';
import '../widgets/wedding_details_section.dart';

class WeddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weddingInfo = WeddingInfo(
      brideName: 'Trần Thị B',
      groomName: 'Nguyễn Văn A',
      weddingDate: DateTime(2025, 10, 20),
      ceremonyVenue: 'Nhà thờ Lớn Hà Nội',
      ceremonyAddress: '40 Nhà Chung, Hoàn Kiếm, Hà Nội',
      ceremonyTime: '09:00 - 11:00, Chủ Nhật 20/10/2025',
      receptionVenue: 'Trung tâm Tiệc cưới Diamond',
      receptionAddress: '123 Đường Láng, Đống Đa, Hà Nội',
      receptionTime: '18:00 - 21:00, Chủ Nhật 20/10/2025',
      loveStory: '...',
      timeline: [],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: WeddingDetailsSection(
          weddingInfo: weddingInfo,
        ),
      ),
    );
  }
}
```

### Custom Padding

```dart
WeddingDetailsSection(
  weddingInfo: myWeddingInfo,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
)
```

## 🎯 Event Card Structure

Each event card displays:

1. **Event Icon & Title**
   - Ceremony: Church icon 
   - Reception: Celebration icon
   - Pink background with shadow

2. **Time Information**
   - Clock icon with gold accent
   - Time range and date

3. **Venue Information**
   - Building icon with gold accent
   - Venue name

4. **Address Information**
   - Location pin icon with gold accent
   - Full address

5. **Action Buttons**
   - **Chỉ đường**: Opens Google Maps/Apple Maps
   - **Sao chép**: Copies address to clipboard

## 🔗 Interactive Features

### Directions Button

Opens navigation apps with the event address:
- **Primary**: Google Maps (web or app)
- **Fallback**: Apple Maps (iOS)
- **Error Handling**: Shows error SnackBar if maps can't be opened

### Copy Address Button

Copies the full address to clipboard:
- Uses `Clipboard.setData()` from `flutter/services.dart`
- Shows success SnackBar with green background
- SnackBar displays for 2 seconds

## 📦 Dependencies Required

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  url_launcher: ^6.1.0  # For opening maps
```

## 🏗️ Component Hierarchy

```
WeddingDetailsSection
├── Section Title
├── _EventCard (Ceremony)
│   ├── Icon + Title
│   ├── _InfoRow (Time)
│   ├── _InfoRow (Venue)
│   ├── _InfoRow (Address)
│   └── Action Buttons
│       ├── Directions Button
│       └── Copy Button
└── _EventCard (Reception)
    ├── Icon + Title
    ├── _InfoRow (Time)
    ├── _InfoRow (Venue)
    ├── _InfoRow (Address)
    └── Action Buttons
        ├── Directions Button
        └── Copy Button
```

## 🎨 Card Design Details

### Card Properties
- **Elevation**: 8
- **Border Radius**: 16px
- **Gradient**: White → Pink 50 (30% opacity)
- **Shadow**: Pink shadow under icon containers

### Button Styles

#### Directions Button (Elevated)
- Background: Pink 400
- Foreground: White
- Elevation: 4
- Border Radius: 12px
- Icon: `Icons.directions`

#### Copy Button (Outlined)
- Border: Pink 400, 2px
- Foreground: Pink 400
- Border Radius: 12px
- Icon: `Icons.content_copy`

## 🚀 Integration Steps

1. **Add dependency** to `pubspec.yaml`:
   ```bash
   flutter pub add url_launcher
   ```

2. **Import the widget**:
   ```dart
   import 'package:wedding_invitation_app/widgets/wedding_details_section.dart';
   ```

3. **Prepare WeddingInfo data** with ceremony and reception details

4. **Add to your widget tree**:
   ```dart
   WeddingDetailsSection(weddingInfo: yourWeddingInfo)
   ```

## 🔍 Error Handling

### Map Launch Failures
- Tries Google Maps first
- Falls back to Apple Maps
- Shows user-friendly error message if both fail

### Context Safety
- Uses `context.mounted` checks before showing SnackBars
- Prevents errors when widget is disposed

## 💡 Best Practices

1. **Always wrap in ScrollView** for smaller screens:
   ```dart
   SingleChildScrollView(
     child: WeddingDetailsSection(weddingInfo: info),
   )
   ```

2. **Provide accurate addresses** for best maps experience

3. **Test on both platforms** (iOS and Android) for maps integration

4. **Consider accessibility** - icons are paired with text labels

## 📊 Performance

- **Lightweight**: No heavy animations or computations
- **Efficient rendering**: Uses const constructors where possible
- **Async operations**: URL launching and clipboard don't block UI

## 🎯 Use Cases

1. **Full Wedding Page**: Display alongside other sections
2. **Standalone Details Page**: Focus on event logistics
3. **Email/Print Preview**: Show event information clearly
4. **RSVP Confirmation**: Include in confirmation page

## ✅ Checklist for Implementation

- [ ] Add `url_launcher` to dependencies
- [ ] Import `WeddingDetailsSection` widget
- [ ] Create `WeddingInfo` object with ceremony and reception data
- [ ] Add widget to your page layout
- [ ] Test "Chỉ đường" button on device
- [ ] Test "Sao chép" button functionality
- [ ] Verify responsive behavior on different screen sizes

## 🐛 Troubleshooting

### Maps not opening?
- Check that `url_launcher` is properly installed
- Verify device has maps app installed
- Check address encoding is correct

### Copy not working?
- Ensure clipboard permissions are granted
- Check device clipboard functionality

### Layout issues?
- Verify parent widget allows proper sizing
- Check for conflicting padding/margins
- Ensure SingleChildScrollView for overflow handling

## 📝 Notes

- Widget uses Vietnamese labels throughout
- Designed to match wedding app aesthetic
- Follows Flutter best practices and null safety
- Consistent with other widgets in the app (e.g., StoryTimelineSection)

---

**Ready to use! 🎉**
