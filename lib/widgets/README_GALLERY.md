# GallerySection Widget

## Overview
`GallerySection` is a Flutter widget that displays a wedding photo gallery with a responsive grid layout and full-screen lightbox viewer. It features smooth Hero animations, swipe gestures, and comprehensive error handling.

## Features

- ✅ **Responsive Grid Layout** - 2 columns (mobile), 3 columns (tablet), 4 columns (desktop)
- ✅ **Image Categories** - Support for Pre-wedding, Engagement, Family photos, and more
- ✅ **Lightbox Viewer** - Full-screen image viewer with Hero animations
- ✅ **Navigation Controls** - Previous/Next arrow buttons in lightbox
- ✅ **Swipe Gestures** - Swipe left/right to navigate between images
- ✅ **Lazy Loading** - Images load on-demand with loading indicators
- ✅ **Loading States** - Shimmer effect placeholder during image loading
- ✅ **Error Handling** - Graceful error placeholders for failed image loads
- ✅ **Wedding Theme** - Pink, gold, and cream color scheme
- ✅ **Vietnamese Labels** - All UI text in Vietnamese
- ✅ **Interactive Viewer** - Pinch to zoom in lightbox (0.5x - 4x)
- ✅ **Image Captions** - Optional captions displayed in lightbox
- ✅ **Smooth Animations** - Fade-in and scale animations for thumbnails

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import '../widgets/gallery_section.dart';

class MyWeddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final images = [
      GalleryImage(
        imageUrl: 'https://example.com/photo1.jpg',
        category: 'Pre-wedding',
        caption: 'Khoảnh khắc ngọt ngào',
      ),
      GalleryImage(
        imageUrl: 'https://example.com/photo2.jpg',
        category: 'Engagement',
        caption: 'Lễ đính hôn',
      ),
      GalleryImage(
        imageUrl: 'https://example.com/photo3.jpg',
        category: 'Family',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: GallerySection(
          images: images,
          title: 'Album Ảnh Cưới',
        ),
      ),
    );
  }
}
```

### With Custom Padding

```dart
GallerySection(
  images: myImages,
  title: 'Kỷ Niệm Của Chúng Tôi',
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
)
```

### Without Title

```dart
GallerySection(
  images: myImages,
  // No title - just display the grid
)
```

## Properties

### GallerySection

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `images` | `List<GalleryImage>` | Yes | - | List of gallery images to display |
| `title` | `String?` | No | `null` | Optional section title |
| `padding` | `EdgeInsets?` | No | Responsive padding | Custom padding for the section |

### GalleryImage

| Property | Type | Required | Default | Description |
|----------|------|----------|---------|-------------|
| `imageUrl` | `String` | Yes | - | URL of the image to display |
| `category` | `String` | Yes | - | Category label (e.g., 'Pre-wedding', 'Engagement') |
| `caption` | `String?` | No | `null` | Optional caption shown in lightbox |

## Grid Layout

### Responsive Breakpoints

- **Mobile (< 600px)**: 2 columns, 16px horizontal padding
- **Tablet (600px - 899px)**: 3 columns, 48px horizontal padding  
- **Desktop (≥ 900px)**: 4 columns, 48px horizontal padding

### Thumbnail Features

- **Aspect Ratio**: 1:1 (square)
- **Border Radius**: 12px rounded corners
- **Shadow**: Pink shadow with 0.3 opacity, 8px blur, 4px offset
- **Spacing**: 12px gap between items
- **Category Badge**: Semi-transparent overlay at bottom with category text
- **Loading State**: Pink shimmer effect with circular progress indicator
- **Error State**: Pink placeholder with "Không thể tải ảnh" message

## Lightbox Viewer

### Features

1. **Full-Screen Display** - Black background overlay
2. **Hero Animation** - Smooth transition from thumbnail to full-screen
3. **Interactive Zoom** - Pinch to zoom (0.5x to 4x)
4. **Swipe Navigation** - Swipe left/right to navigate between images
5. **Arrow Navigation** - Left/right arrow buttons
6. **Close Button** - X button in top-right corner
7. **Image Counter** - "1/10" display in top-left corner
8. **Caption Display** - Optional caption at bottom (if provided)
9. **Tap to Close** - Tap outside image to exit

### Navigation Controls

- **Previous Button**: Shows on left when not at first image
- **Next Button**: Shows on right when not at last image
- **Swipe Gestures**: PageView handles left/right swipes automatically
- **Keyboard**: Can be extended to support arrow keys

### UI Elements

- **Close Button** (Top-right): 48x48 circular button with X icon
- **Counter** (Top-left): Black semi-transparent badge with current/total
- **Navigation Arrows**: 48x48 circular buttons with chevron icons
- **Caption** (Bottom): Black semi-transparent rounded container

## Color Scheme

The widget uses the wedding app's color palette:

- **Pink (`Colors.pink.shade700`)** - Section title
- **Pink (`Colors.pink.shade200-400`)** - Shadows, loading indicators, dots
- **Pink (`Colors.pink.shade50`)** - Loading/error backgrounds
- **Gold (`Color(0xFFFFC107)`)** - (Available via AppTheme for future use)
- **Cream** - Light pink shades for backgrounds
- **Black** - Lightbox background and overlays (with opacity)
- **White** - Lightbox UI text and icons

## Animation Details

### Thumbnail Animations
- **Fade In**: 500ms duration, staggered by 50ms per item
- **Scale**: From 0.9 to 1.0, synchronized with fade-in
- **Shimmer**: 1500ms looping animation during loading

### Lightbox Animations
- **Hero Transition**: Automatic Hero animation between thumbnail and fullscreen
- **Page Transition**: 300ms ease-in-out curve for swipe navigation
- **Loading**: Circular progress indicator with optional progress value

## Error Handling

### Thumbnail Errors
- Displays pink background with icon and "Không thể tải ảnh" message
- Category badge is hidden for error state
- Thumbnail remains tappable (opens lightbox showing error)

### Lightbox Errors
- Shows dark gray background with error icon and message
- "Không thể tải ảnh" in white text
- User can still navigate to other images

## Performance Optimizations

1. **Lazy Loading**: Images only load when needed via `Image.network`
2. **Loading Builders**: Show loading state instead of blank space
3. **Shrink Wrap Grid**: GridView shrinks to fit content (no scroll conflict)
4. **Never Scrollable**: Grid doesn't scroll independently (embedded in parent)
5. **Dispose Cleanup**: PageController properly disposed in lightbox

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animate: ^1.0.0
```

## Design Principles

This widget follows the wedding app's design principles:

- **Elegant & Romantic** - Soft colors, rounded corners, gentle shadows
- **Responsive** - Adapts to mobile, tablet, and desktop screen sizes
- **Delightful** - Smooth animations and transitions
- **User-Friendly** - Intuitive navigation and clear error states
- **Vietnamese** - All labels and messages in Vietnamese
- **Performance** - Optimized loading and rendering

## Example Data

See `lib/examples/gallery_example.dart` for complete working examples with sample data.

## Common Use Cases

### Wedding Photo Album
```dart
final weddingPhotos = [
  GalleryImage(
    imageUrl: 'https://example.com/prewedding1.jpg',
    category: 'Pre-wedding',
    caption: 'Chụp ảnh cưới tại Đà Lạt',
  ),
  // ... more photos
];

GallerySection(
  images: weddingPhotos,
  title: 'Album Ảnh Cưới',
)
```

### Engagement Photos
```dart
final engagementPhotos = [
  GalleryImage(
    imageUrl: 'https://example.com/engagement1.jpg',
    category: 'Engagement',
    caption: 'Lễ đính hôn ngày 10/10/2024',
  ),
  // ... more photos
];

GallerySection(
  images: engagementPhotos,
  title: 'Lễ Đính Hôn',
)
```

### Family Photos
```dart
final familyPhotos = [
  GalleryImage(
    imageUrl: 'https://example.com/family1.jpg',
    category: 'Family',
    caption: 'Gia đình hai bên',
  ),
  // ... more photos
];

GallerySection(
  images: familyPhotos,
  title: 'Gia Đình',
)
```

## Customization Tips

### Adjust Grid Columns
Edit the `crossAxisCount` calculation in `GallerySection.build()`:
```dart
final crossAxisCount = isMobile ? 2 : (screenWidth < 900 ? 3 : 4);
```

### Change Aspect Ratio
Edit `childAspectRatio` in GridDelegate:
```dart
childAspectRatio: 1.0, // 1:1 square, 1.5 for landscape, 0.75 for portrait
```

### Customize Colors
Colors can be modified in the widget code or extracted to use AppTheme:
- Thumbnail shadows: `Colors.pink.shade200`
- Loading indicator: `Colors.pink.shade300`
- Category badge: `Colors.black.withOpacity(0.6)`
- Lightbox background: `Colors.black`

### Add Image Filters
Wrap Image.network in ColorFiltered or ShaderMask for effects:
```dart
ColorFiltered(
  colorFilter: ColorFilter.mode(
    Colors.pink.withOpacity(0.1),
    BlendMode.srcOver,
  ),
  child: Image.network(...),
)
```

## Accessibility

- All interactive elements have minimum 48x48 touch targets
- Image error states provide clear text alternatives
- Semantic labels can be added to buttons for screen readers
- High contrast between UI elements and backgrounds

## Notes

- Images should be optimized for web (compress before uploading)
- Consider using thumbnails for grid and full-size for lightbox
- Category names should be short (max 15 characters for badge)
- Caption text wraps automatically in lightbox
- PageView handles all gesture detection for swipe navigation
- Hero tag must be unique per image (uses index-based tags)
- InteractiveViewer allows pinch-to-zoom in lightbox

## Future Enhancements

Potential features to add:
- Filter by category
- Share image functionality
- Download image option
- Full-screen slideshow mode
- Keyboard navigation support
- Image zoom animations
- Lazy loading for large galleries (pagination)
- Category tabs for filtering
- Image metadata display
