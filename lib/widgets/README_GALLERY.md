# GallerySection Widget - Complete Documentation

## Overview

The **GallerySection** widget is a beautiful, feature-rich photo gallery component designed for wedding invitation websites. It provides a responsive grid layout with category filtering and an immersive lightbox viewer.

## Features

✅ **Responsive Grid Layout** - Adapts to different screen sizes (2-4 columns)  
✅ **Category Filtering** - Filter images by category (All, Pre-wedding, Engagement, Family)  
✅ **Lightbox Viewer** - Full-screen image viewing with smooth transitions  
✅ **Hero Animations** - Seamless transition from thumbnail to full view  
✅ **Swipe Navigation** - Swipe left/right to navigate between images  
✅ **Lazy Loading** - Progressive image loading with placeholders  
✅ **Interactive Viewer** - Pinch-to-zoom in lightbox mode  
✅ **Vietnamese Labels** - Category labels in Vietnamese  
✅ **Wedding Theme** - Pink, gold, and cream color scheme  
✅ **Error Handling** - Graceful fallback for loading errors  

## Installation

The widget is already included in the `lib/widgets/` directory. No additional dependencies needed beyond what's in `pubspec.yaml`.

## Basic Usage

```dart
import 'package:flutter/material.dart';
import '../widgets/gallery_section.dart';

class WeddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final images = [
      GalleryImage(
        url: 'https://example.com/photo1.jpg',
        category: 'Pre-wedding',
        title: 'Sunset Beach',
        description: 'Beautiful sunset at the beach',
      ),
      GalleryImage(
        url: 'https://example.com/photo2.jpg',
        category: 'Đính hôn',
      ),
      // ... more images
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: GallerySection(
          images: images,
        ),
      ),
    );
  }
}
```

## API Reference

### GallerySection Widget

Main widget that displays the photo gallery.

#### Properties

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `images` | `List<GalleryImage>` | Yes | - | List of images to display |
| `padding` | `EdgeInsets?` | No | Auto | Custom padding (auto-responsive if null) |
| `title` | `String` | No | `'Album Ảnh Cưới'` | Section title text |

#### Example with Custom Properties

```dart
GallerySection(
  images: myImages,
  title: 'Kỷ Niệm Của Chúng Tôi',
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
)
```

### GalleryImage Model

Model class for gallery images.

#### Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `url` | `String` | Yes | Image URL (network or asset) |
| `category` | `String` | Yes | Category name (use GalleryCategory labels) |
| `title` | `String?` | No | Image title (shown in lightbox) |
| `description` | `String?` | No | Image description (shown in lightbox) |

#### Example

```dart
const GalleryImage(
  url: 'https://example.com/wedding-photo.jpg',
  category: 'Pre-wedding',
  title: 'Hoàng hôn biển',
  description: 'Chụp tại bãi biển Đà Nẵng',
)
```

### GalleryCategory Enum

Predefined categories with Vietnamese labels.

| Enum Value | Label | Description |
|------------|-------|-------------|
| `GalleryCategory.all` | `'Tất cả'` | All images |
| `GalleryCategory.preWedding` | `'Pre-wedding'` | Pre-wedding photos |
| `GalleryCategory.engagement` | `'Đính hôn'` | Engagement photos |
| `GalleryCategory.family` | `'Gia đình'` | Family photos |

#### Usage

```dart
// Get the Vietnamese label
String label = GalleryCategory.preWedding.label; // Returns 'Pre-wedding'

// Use in GalleryImage
GalleryImage(
  url: 'photo.jpg',
  category: GalleryCategory.preWedding.label,
)
```

## Responsive Behavior

### Grid Columns

| Screen Width | Columns | Layout Type |
|--------------|---------|-------------|
| < 600px | 2 | Mobile |
| 600px - 899px | 3 | Tablet |
| ≥ 900px | 4 | Desktop |

### Spacing

| Screen Size | Horizontal Padding | Vertical Padding |
|-------------|-------------------|------------------|
| Mobile | 16px | 32px |
| Desktop | 48px | 32px |

## Lightbox Features

### Navigation

- **Swipe Gestures**: Swipe left/right to navigate
- **Arrow Buttons**: Click left/right arrows (hidden on edges)
- **Tap to Close**: Tap anywhere on the image to close
- **Close Button**: Top-right X button

### Zoom

- **Pinch to Zoom**: Supports 1x to 4x zoom
- **Interactive Viewer**: Pan around zoomed images

### Visual Elements

- **Hero Transitions**: Smooth animation from thumbnail
- **Page Indicators**: Dots showing current position
- **Image Info**: Title and description overlay (if provided)
- **Loading States**: Progress indicator during load
- **Error States**: Fallback UI for failed loads

## Color Scheme

| Element | Color | Hex Code |
|---------|-------|----------|
| Section Title | Pink (shade 700) | #C2185B |
| Active Category | Pink (shade 400) | #EC407A |
| Inactive Category BG | Pink (shade 50) | #FCE4EC |
| Category Border | Pink (shade 200) | #F48FB1 |
| Loading Indicator | Pink (shade 300) | #F06292 |
| Page Indicator (active) | Pink (shade 400) | #EC407A |
| Page Indicator (inactive) | White (50% opacity) | #FFFFFF80 |

## Animations

### Entrance Animations

| Element | Animation | Delay | Duration |
|---------|-----------|-------|----------|
| Section Title | fadeIn + slideY | 0ms | 600ms |
| Category Tabs | fadeIn + slideX | 300ms | 500ms |
| Thumbnails | fadeIn | 300ms + (index × 50ms) | 500ms |

### Interactive Animations

| Element | Animation | Duration |
|---------|-----------|----------|
| Category Selection | Container color/border | 300ms |
| Lightbox Open | Fade transition | Default |
| Page Change | Smooth scroll | 300ms |

## Error Handling

### Image Loading Errors

The widget gracefully handles loading failures:

**Thumbnail Error State**:
- Pink background (#FCE4EC)
- Broken image icon
- "Không tải được" text

**Lightbox Error State**:
- Pink background
- Larger broken image icon (64px)
- "Không tải được ảnh" text

### Empty State

When no images match the selected category:
- Centered message: "Không có ảnh trong danh mục này"
- Gray text for subtle appearance

## Performance Optimizations

1. **Lazy Loading**: Images load on-demand with progress indicators
2. **GridView.builder**: Only builds visible thumbnails
3. **shrinkWrap**: Efficient embedding in scrollable parents
4. **Hero Animations**: GPU-accelerated shared element transitions
5. **Const Constructors**: Reduces unnecessary rebuilds
6. **Image Caching**: Network images are cached by Flutter

## Examples

### Example 1: Basic Gallery

```dart
final images = [
  GalleryImage(
    url: 'https://example.com/photo1.jpg',
    category: GalleryCategory.preWedding.label,
  ),
  GalleryImage(
    url: 'https://example.com/photo2.jpg',
    category: GalleryCategory.engagement.label,
  ),
];

GallerySection(images: images)
```

### Example 2: With Titles and Descriptions

```dart
final images = [
  GalleryImage(
    url: 'https://example.com/beach.jpg',
    category: GalleryCategory.preWedding.label,
    title: 'Hoàng hôn biển',
    description: 'Chụp tại bãi biển Đà Nẵng vào lúc hoàng hôn',
  ),
];

GallerySection(images: images)
```

### Example 3: Custom Title and Padding

```dart
GallerySection(
  images: myImages,
  title: 'Những Khoảnh Khắc Đẹp',
  padding: EdgeInsets.all(24),
)
```

## Running the Example

A complete working example is provided:

```bash
flutter run lib/examples/gallery_section_example.dart
```

This demonstrates:
- Multiple image categories
- Various thumbnails with different data
- Full lightbox functionality
- Responsive behavior

## Best Practices

### Image URLs

- Use high-quality images (at least 800x800px)
- Optimize file sizes for web delivery
- Use CDN for better performance
- Provide square or similar aspect ratio images for grid

### Categories

- Use consistent category labels
- Use `GalleryCategory` enum for standardization
- Don't create too many categories (3-4 is ideal)

### Titles and Descriptions

- Keep titles short (1-5 words)
- Descriptions should be brief (1-2 sentences)
- Use Vietnamese for consistency
- Only add when meaningful (optional is fine)

### Layout

- Embed in `SingleChildScrollView` for scrollable pages
- Allow natural responsive behavior (don't force padding)
- Ensure images are high enough resolution for mobile displays

## Troubleshooting

### Images Not Loading

- Check image URLs are accessible
- Verify network permissions in Android/iOS
- Check for CORS issues on web
- Ensure URLs use HTTPS

### Layout Issues

- Ensure parent widget is scrollable
- Check that images have proper aspect ratios
- Verify screen width calculations

### Animation Glitches

- Ensure unique keys for images
- Check that Hero tags are unique per image
- Verify no conflicting animations in parent

## Integration Checklist

- [ ] Import the widget: `import '../widgets/gallery_section.dart'`
- [ ] Prepare image data (List<GalleryImage>)
- [ ] Assign categories using `GalleryCategory.*.label`
- [ ] Optionally add titles and descriptions
- [ ] Embed in scrollable parent widget
- [ ] Test on different screen sizes
- [ ] Verify image loading and error states
- [ ] Test lightbox navigation and zoom

## Technical Details

### Widget Tree Structure

```
GallerySection (StatefulWidget)
├── Container (responsive padding)
│   └── Column
│       ├── Text (section title)
│       ├── SingleChildScrollView (category tabs)
│       │   └── Row
│       │       └── _CategoryChip (for each category)
│       └── GridView.builder (image grid)
│           └── _GalleryThumbnail (for each image)
│               └── Hero + Image.network
│
_LightboxViewer (full-screen overlay)
├── PageView.builder (swipeable images)
│   └── Hero + InteractiveViewer + Image.network
├── Close button (top-right)
├── Navigation arrows (left/right)
├── Page indicators (bottom)
└── Image info overlay (bottom)
```

### State Management

- Uses `StatefulWidget` for category selection
- `_selectedCategory` state tracks active filter
- `_filteredImages` computed property for efficiency
- Lightbox uses separate stateful widget for page tracking

## Dependencies

All required dependencies are already in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animate: ^1.0.0  # For entrance animations
```

## Browser Support

The widget works on all Flutter-supported platforms:
- ✅ iOS
- ✅ Android
- ✅ Web (Chrome, Safari, Firefox, Edge)
- ✅ Desktop (Windows, macOS, Linux)

## License

Part of the Wedding Invitation App project.

---

**Questions or Issues?** Check the example file or raise an issue in the repository.
