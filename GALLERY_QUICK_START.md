# GallerySection Widget - Quick Start Guide

## What is GallerySection?

A beautiful, production-ready photo gallery widget for Flutter wedding invitation apps. Features responsive grid layout, category filtering, and an immersive lightbox viewer with smooth animations.

## Quick Integration (5 minutes)

### Step 1: Import the Widget

```dart
import 'package:flutter/material.dart';
import '../widgets/gallery_section.dart';
```

### Step 2: Prepare Your Images

```dart
final myGalleryImages = [
  GalleryImage(
    url: 'https://yourcdn.com/prewedding1.jpg',
    category: GalleryCategory.preWedding.label,
    title: 'Hoàng hôn biển',
    description: 'Chụp tại Đà Nẵng',
  ),
  GalleryImage(
    url: 'https://yourcdn.com/engagement1.jpg',
    category: GalleryCategory.engagement.label,
    title: 'Lễ đính hôn',
  ),
  GalleryImage(
    url: 'https://yourcdn.com/family1.jpg',
    category: GalleryCategory.family.label,
  ),
  // Add more images...
];
```

### Step 3: Add to Your Page

```dart
class WeddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your other sections...
            GallerySection(images: myGalleryImages),
            // More sections...
          ],
        ),
      ),
    );
  }
}
```

**That's it!** Your gallery is ready. 🎉

## Run the Example

See it in action:

```bash
flutter run lib/examples/gallery_section_example.dart
```

## Features

✅ **Responsive Grid** - 2/3/4 columns based on screen size  
✅ **Category Tabs** - Filter by Pre-wedding, Engagement, Family  
✅ **Lightbox Viewer** - Full-screen image viewing  
✅ **Hero Animations** - Smooth thumbnail-to-fullscreen transition  
✅ **Swipe Navigation** - Swipe between images or use arrows  
✅ **Pinch to Zoom** - Zoom up to 4x in lightbox  
✅ **Lazy Loading** - Progressive image loading with indicators  
✅ **Vietnamese** - Category labels in Vietnamese  
✅ **Wedding Theme** - Beautiful pink and gold color scheme  
✅ **Error Handling** - Graceful fallbacks for loading failures  

## Categories

Use the built-in categories:

```dart
GalleryCategory.all.label          // "Tất cả"
GalleryCategory.preWedding.label   // "Pre-wedding"
GalleryCategory.engagement.label   // "Đính hôn"
GalleryCategory.family.label       // "Gia đình"
```

## Customization

### Custom Title

```dart
GallerySection(
  images: myImages,
  title: 'Những Khoảnh Khắc Đẹp',  // Custom title
)
```

### Custom Padding

```dart
GallerySection(
  images: myImages,
  padding: EdgeInsets.all(24),  // Custom padding
)
```

## Widget Properties

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `images` | `List<GalleryImage>` | ✅ Yes | - | Gallery images |
| `title` | `String` | ❌ No | `'Album Ảnh Cưới'` | Section title |
| `padding` | `EdgeInsets?` | ❌ No | Auto-responsive | Container padding |

## GalleryImage Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `url` | `String` | ✅ Yes | Image URL (network or asset) |
| `category` | `String` | ✅ Yes | Category (use GalleryCategory labels) |
| `title` | `String?` | ❌ No | Title shown in lightbox |
| `description` | `String?` | ❌ No | Description shown in lightbox |

## User Interactions

### Grid View
- **Tap category** → Filter images by category
- **Tap thumbnail** → Open lightbox viewer

### Lightbox View
- **Swipe left/right** → Navigate between images
- **Tap arrows** → Navigate between images (desktop)
- **Pinch** → Zoom in/out (1x to 4x)
- **Pan** → Move around zoomed image
- **Tap image** → Close lightbox
- **Tap [X]** → Close lightbox

## Responsive Behavior

| Screen Size | Columns | Padding |
|-------------|---------|---------|
| Mobile (< 600px) | 2 | 16px |
| Tablet (600-899px) | 3 | 48px |
| Desktop (≥ 900px) | 4 | 48px |

## Error Handling

The widget gracefully handles:
- ✅ Network failures (shows fallback UI)
- ✅ Slow loading (shows progress indicator)
- ✅ Missing images (displays error icon)
- ✅ Empty categories (shows message)

## Documentation

For detailed documentation, see:

1. **[README_GALLERY.md](lib/widgets/README_GALLERY.md)** - Complete API reference
2. **[GALLERY_IMPLEMENTATION_SUMMARY.md](GALLERY_IMPLEMENTATION_SUMMARY.md)** - Technical details
3. **[GALLERY_VISUAL_SUMMARY.md](GALLERY_VISUAL_SUMMARY.md)** - Visual diagrams
4. **[gallery_section_example.dart](lib/examples/gallery_section_example.dart)** - Working example

## Files Included

```
lib/
├── widgets/
│   ├── gallery_section.dart       (527 lines) - Main widget
│   └── README_GALLERY.md          (405 lines) - API docs
│
└── examples/
    └── gallery_section_example.dart (125 lines) - Demo app

Documentation/
├── GALLERY_IMPLEMENTATION_SUMMARY.md - Implementation details
├── GALLERY_VISUAL_SUMMARY.md        - Visual diagrams
└── GALLERY_QUICK_START.md           - This guide
```

## Dependencies

Already in your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animate: ^1.0.0  # For animations
```

No new dependencies needed! ✨

## Best Practices

### Image URLs
- Use high-quality images (minimum 800x800px)
- Optimize for web (compress images)
- Use square or similar aspect ratios
- Host on a CDN for better performance

### Categories
- Keep to 3-4 categories for best UX
- Use GalleryCategory enum for consistency
- Ensure each image has a valid category

### Titles & Descriptions
- Keep titles short (1-5 words)
- Keep descriptions brief (1-2 sentences)
- Use Vietnamese for consistency
- Only add when meaningful

## Troubleshooting

### Images not loading?
- ✅ Check image URLs are accessible
- ✅ Verify internet permissions (Android/iOS)
- ✅ Ensure URLs use HTTPS
- ✅ Check for CORS issues (web)

### Layout issues?
- ✅ Embed in SingleChildScrollView
- ✅ Ensure parent is scrollable
- ✅ Check image aspect ratios

### Animation glitches?
- ✅ Ensure Hero tags are unique
- ✅ Check for conflicting animations
- ✅ Verify no duplicate keys

## Performance Tips

- ✅ Images are cached automatically
- ✅ Only visible thumbnails are built
- ✅ Lazy loading reduces initial load
- ✅ Hero animations are GPU-accelerated
- ✅ Use optimized image formats (WebP, JPEG)

## Browser Support

Works on all Flutter platforms:
- ✅ Android
- ✅ iOS
- ✅ Web (Chrome, Safari, Firefox, Edge)
- ✅ Desktop (Windows, macOS, Linux)

## Example Variations

### Minimal Example
```dart
GallerySection(
  images: [
    GalleryImage(
      url: 'photo.jpg',
      category: GalleryCategory.preWedding.label,
    ),
  ],
)
```

### With Metadata
```dart
GallerySection(
  images: [
    GalleryImage(
      url: 'photo.jpg',
      category: GalleryCategory.preWedding.label,
      title: 'Beautiful Sunset',
      description: 'At the beach',
    ),
  ],
)
```

### Custom Configuration
```dart
GallerySection(
  images: myImages,
  title: 'Our Memories',
  padding: EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 48,
  ),
)
```

## Need Help?

- 📖 Check the [full documentation](lib/widgets/README_GALLERY.md)
- 🎨 See the [visual guide](GALLERY_VISUAL_SUMMARY.md)
- 💻 Run the [example app](lib/examples/gallery_section_example.dart)
- 📝 Review the [implementation summary](GALLERY_IMPLEMENTATION_SUMMARY.md)

## License

Part of the Wedding Invitation App project.

---

**Ready to use! No additional setup required.** 🚀

Happy coding! 💝
