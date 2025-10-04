# GallerySection Widget - Quick Reference

## 🚀 Quick Start

### 1. Import the widget
```dart
import 'package:wedding_invitation_app/widgets/gallery_section.dart';
import 'package:wedding_invitation_app/features/wedding/domain/entities/gallery_image.dart';
```

### 2. Create your images
```dart
final images = [
  GalleryImage(
    id: '1',
    imageUrl: 'https://example.com/photo1.jpg',
    category: 'Pre-wedding',
    title: 'Chụp ảnh cưới tại biển',
    description: 'Những khoảnh khắc tuyệt vời',
  ),
  GalleryImage(
    id: '2',
    imageUrl: 'https://example.com/photo2.jpg',
    category: 'Engagement',
  ),
];
```

### 3. Use the widget
```dart
GallerySection(
  images: images,
  title: 'Album Ảnh Cưới',
)
```

## 📦 What's Included

### Files Created
- ✅ `lib/features/wedding/domain/entities/gallery_image.dart` - Data model
- ✅ `lib/widgets/gallery_section.dart` - Main widget (534 lines)
- ✅ `lib/examples/gallery_section_example.dart` - Working example
- ✅ `lib/widgets/README_GALLERY_SECTION.md` - Full documentation
- ✅ `GALLERY_IMPLEMENTATION_SUMMARY.md` - Implementation summary
- ✅ `GALLERY_VISUAL_GUIDE.md` - Visual guide

### Features
- ✅ Responsive grid layout (2-4 columns)
- ✅ Lightbox viewer with Hero animations
- ✅ Swipe gestures (left/right navigation)
- ✅ Navigation arrows (Previous/Next)
- ✅ Pinch-to-zoom (0.5x to 4x)
- ✅ Lazy loading with shimmer effect
- ✅ Error handling with fallback UI
- ✅ Image counter (1/10 format)
- ✅ Wedding theme colors
- ✅ Vietnamese language support

## 🎨 Color Reference

| Element | Color | Code |
|---------|-------|------|
| Title | Pink Shade 700 | `Colors.pink.shade700` |
| Loading | Pink Shade 300 | `Colors.pink.shade300` |
| Background | Pink Shade 50 | `Colors.pink.shade50` |
| Gold Accent | Gold | `Color(0xFFFFC107)` |

## 📱 Responsive Breakpoints

| Screen Size | Columns | Spacing | Padding |
|-------------|---------|---------|---------|
| < 600px | 2 | 8px | 16px |
| 600-899px | 3 | 16px | 48px |
| ≥ 900px | 4 | 16px | 48px |

## 🎯 Widget API

### GallerySection
```dart
GallerySection({
  required List<GalleryImage> images,  // Required
  String? title,                       // Optional
  EdgeInsets? padding,                 // Optional
})
```

### GalleryImage
```dart
GalleryImage({
  required String id,          // Unique identifier
  required String imageUrl,    // Image URL
  required String category,    // Category name
  String? title,              // Optional title
  String? description,        // Optional description
})
```

## 🎮 User Interactions

### Grid
- **Tap** → Open lightbox at image

### Lightbox
- **Swipe left** → Next image
- **Swipe right** → Previous image
- **Pinch out** → Zoom in
- **Pinch in** → Zoom out
- **Tap X** → Close lightbox
- **Tap arrows** → Navigate
- **Drag (when zoomed)** → Pan image

## ⚡ Performance Tips

1. Use appropriate image sizes (recommended: 800-1200px)
2. Optimize images before upload
3. Use CDN for faster loading
4. Provide error handling for network issues
5. Test with various image counts

## 🐛 Common Issues

### Issue: Images not loading
**Solution**: Check network connection and image URLs

### Issue: Shimmer not showing
**Solution**: Ensure `flutter_animate` is in pubspec.yaml

### Issue: Hero animation not working
**Solution**: Ensure each image has a unique `id`

### Issue: Grid not responsive
**Solution**: Widget must be in a scrollable parent

## 📚 Documentation

- **Full API Documentation**: `lib/widgets/README_GALLERY_SECTION.md`
- **Implementation Details**: `GALLERY_IMPLEMENTATION_SUMMARY.md`
- **Visual Guide**: `GALLERY_VISUAL_GUIDE.md`
- **Working Example**: `lib/examples/gallery_section_example.dart`

## 🧪 Run Example

```bash
flutter run lib/examples/gallery_section_example.dart
```

## ✅ Checklist

Before using in production:
- [ ] Images are optimized and hosted
- [ ] All image URLs are valid
- [ ] Each image has a unique ID
- [ ] Error handling is tested
- [ ] Responsive design is verified
- [ ] Loading states are working
- [ ] Swipe gestures are smooth
- [ ] Hero animations are working

## 🎉 You're Ready!

The GallerySection widget is production-ready and includes:
- Complete implementation
- Working example
- Comprehensive documentation
- Visual guides
- Error handling
- Responsive design
- Wedding theme styling

Just import, create your image list, and use! 💍📸✨
