# Developer Quick Reference

Quick reference guide for developers working on the Wedding Invitation Landing Page.

## 🚀 Quick Commands

```bash
# Install dependencies
flutter pub get

# Run on web
flutter run -d chrome

# Run on mobile
flutter run

# Build for web (production)
flutter build web --release --base-href /wedding/

# Format code
dart format .

# Analyze code
flutter analyze
```

## 📁 File Structure

```
wedding/
├── main.dart                 # Main app entry point
├── lib/
│   ├── widgets/              # All section widgets
│   │   ├── hero_section.dart
│   │   ├── story_timeline_section.dart
│   │   ├── wedding_details_section.dart
│   │   ├── gallery_section.dart
│   │   └── message_section.dart
│   ├── features/
│   │   └── wedding/domain/entities/
│   │       └── wedding_info.dart
│   └── core/
│       ├── theme/app_theme.dart
│       └── base/
└── docs/                     # Documentation
```

## 🎨 Customization Points

### 1. Wedding Information (main.dart)
```dart
// Line ~45-80
final WeddingInfo _weddingInfo = const WeddingInfo(
  brideName: 'Change This',
  groomName: 'Change This',
  weddingDate: DateTime(2025, 10, 20), // Change date
  // ... rest of fields
);
```

### 2. Timeline Events (main.dart)
```dart
// Line ~60-75
timeline: [
  TimelineEvent(
    title: 'Your Title',
    description: 'Your description',
    date: DateTime(2020, 3, 15),
  ),
  // Add more events
],
```

### 3. Gallery Images (main.dart)
```dart
// Line ~85-115
final List<GalleryImage> _galleryImages = const [
  GalleryImage(
    url: 'https://your-image-url.jpg',
    category: 'Pre-wedding', // or 'Đính hôn', 'Gia đình'
    title: 'Optional title',
    description: 'Optional description',
  ),
];
```

### 4. QR Code Data (main.dart)
```dart
// Line ~220-225
MessageSection(
  bankingQRData: 'your-qr-data-here',
  bankAccountInfo: 'Bank Name - Account\nYOUR NAME',
  onMessageSubmit: _handleMessageSubmit,
),
```

### 5. Colors (All widgets)
Primary colors are defined inline in each widget:
- Pink: `Colors.pink.shade400`, `Colors.pink.shade700`
- Gold: `Color(0xFFFFC107)`
- Background: `Colors.pink.shade50`

## 🎭 Widget Reference

### HeroSection
**Location**: `lib/widgets/hero_section.dart`

**Props**:
```dart
HeroSection(
  brideName: String,
  groomName: String,
  weddingDate: DateTime,
)
```

**Features**: Card flip animation, couple names, wedding date

### StoryTimelineSection
**Location**: `lib/widgets/story_timeline_section.dart`

**Props**:
```dart
StoryTimelineSection(
  events: List<TimelineEvent>,
  padding: EdgeInsets?, // Optional
)
```

**Features**: Vertical timeline, dates, descriptions, optional images

### WeddingDetailsSection
**Location**: `lib/widgets/wedding_details_section.dart`

**Props**:
```dart
WeddingDetailsSection(
  weddingInfo: WeddingInfo,
  padding: EdgeInsets?, // Optional
)
```

**Features**: Ceremony/reception cards, map integration, copy address

### GallerySection
**Location**: `lib/widgets/gallery_section.dart`

**Props**:
```dart
GallerySection(
  images: List<GalleryImage>,
  title: String?, // Default: 'Album Ảnh Cưới'
  padding: EdgeInsets?, // Optional
)
```

**Features**: Category filters, grid layout, lightbox viewer

### MessageSection
**Location**: `lib/widgets/message_section.dart`

**Props**:
```dart
MessageSection(
  bankingQRData: String?,
  bankAccountInfo: String?,
  padding: EdgeInsets?,
  onMessageSubmit: Function(String, String)?,
)
```

**Features**: Guest wish form, QR code, form validation

## 🎨 Styling Guide

### Responsive Breakpoints
```dart
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 600;
```

### Common Spacing
```dart
// Section padding
padding: EdgeInsets.symmetric(
  horizontal: isMobile ? 16 : 48,
  vertical: 32,
)

// Card padding
padding: EdgeInsets.all(isMobile ? 16 : 24)
```

### Common Card Style
```dart
Card(
  elevation: 8,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.pink.shade50.withOpacity(0.3),
        ],
      ),
    ),
  ),
)
```

### Section Title Style
```dart
Text(
  'Section Title',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
    color: Colors.pink.shade700,
    fontWeight: FontWeight.bold,
    fontFamily: 'DancingScript',
  ),
)
```

## ✨ Animation Patterns

### Fade In + Slide
```dart
Widget()
  .animate()
  .fadeIn(duration: 600.ms)
  .slideY(begin: -0.3, end: 0)
```

### Staggered List Items
```dart
Widget()
  .animate()
  .fadeIn(
    delay: (300 + index * 200).ms,
    duration: 500.ms,
  )
  .slideX(begin: -0.2, end: 0)
```

### Scale Animation
```dart
Widget()
  .animate()
  .scale(
    delay: 300.ms,
    duration: 400.ms,
  )
```

## 🔧 Common Tasks

### Add New Timeline Event
1. Open `main.dart`
2. Find `timeline:` array (~line 60)
3. Add new `TimelineEvent`:
```dart
TimelineEvent(
  title: 'Event Title',
  description: 'Event description',
  date: DateTime(2024, 6, 15),
  imageUrl: 'optional-image-url',
),
```

### Add New Gallery Image
1. Open `main.dart`
2. Find `_galleryImages` list (~line 85)
3. Add new `GalleryImage`:
```dart
GalleryImage(
  url: 'image-url',
  category: 'Pre-wedding', // or other category
  title: 'Optional title',
  description: 'Optional description',
),
```

### Change Colors
Replace all instances of:
- `Colors.pink.shade400` → your primary color
- `Color(0xFFFFC107)` → your accent color
- `Colors.pink.shade50` → your background tint

Search and replace in all widget files.

### Handle Form Submission
1. Open `main.dart`
2. Find `_handleMessageSubmit` method (~line 120)
3. Add your logic:
```dart
void _handleMessageSubmit(String name, String message) {
  // Send to backend API
  print('Message from $name: $message');
  
  // Example: HTTP POST
  // http.post('your-api-url', body: {...});
}
```

## 🐛 Debugging Tips

### Image Not Loading
- Check URL is accessible
- Check CORS headers (for external images)
- Use placeholder images for testing:
  - Unsplash: `https://source.unsplash.com/800x600/?wedding`

### Animation Not Working
- Ensure `flutter_animate` is imported
- Check delay values aren't too long
- Verify widget is in a visible container

### Responsive Issues
- Check `isMobile` calculation
- Verify padding values for mobile/desktop
- Test in browser DevTools with different viewports

### Form Not Submitting
- Check `_formKey.currentState!.validate()`
- Verify validators return `null` on success
- Check `onMessageSubmit` is provided and working

## 📱 Testing

### Test Responsive Design
```dart
// In browser DevTools:
// 1. Open DevTools (F12)
// 2. Toggle device toolbar (Ctrl+Shift+M)
// 3. Test different screen sizes:
//    - iPhone SE (375px)
//    - iPad (768px)
//    - Desktop (1920px)
```

### Test Animations
- Reload page to see hero animation
- Scroll to each section to trigger animations
- Check animation smoothness

### Test Interactions
- Click gallery images
- Try category filters
- Submit message form
- Click "Get Directions"
- Click "Copy Address"
- Test scroll to top button

## 🚀 Deployment

### GitHub Pages (Quick)
```bash
# 1. Build
flutter build web --release --base-href /wedding/

# 2. Create gh-pages branch
git checkout --orphan gh-pages
git rm -rf .
cp -r build/web/* .
touch .nojekyll

# 3. Deploy
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages

# 4. Go back to main
git checkout main
```

See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for detailed instructions.

## 📚 Additional Resources

- **Flutter Docs**: https://docs.flutter.dev/
- **flutter_animate**: https://pub.dev/packages/flutter_animate
- **qr_flutter**: https://pub.dev/packages/qr_flutter
- **url_launcher**: https://pub.dev/packages/url_launcher

## 💡 Tips

1. **Always test on mobile**: Most guests will view on phones
2. **Optimize images**: Use compressed images (<500KB each)
3. **Test on real devices**: Emulator behavior may differ
4. **Check loading times**: Aim for <3s initial load
5. **Use relative paths**: For better portability
6. **Keep it simple**: Less is more for wedding sites

## 🆘 Need Help?

- Check existing documentation files
- Review widget README files in `lib/widgets/`
- Search issues on GitHub
- Check Flutter documentation

---

**Quick Links**:
- [Full Integration Guide](INTEGRATION_GUIDE.md)
- [Deployment Guide](DEPLOYMENT_GUIDE.md)
- [Visual Layout Guide](VISUAL_LAYOUT_GUIDE.md)
- [Changelog](CHANGELOG.md)
