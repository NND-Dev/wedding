# GallerySection Widget - Visual Guide

## Grid View (Main Gallery Display)

```
┌─────────────────────────────────────────────────────────────┐
│  Album Ảnh Cưới (Optional Title - Pink, Dancing Script)    │
│                                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │          │  │          │  │          │  │          │  │
│  │  Image   │  │  Image   │  │  Image   │  │  Image   │  │
│  │   1:1    │  │   1:1    │  │   1:1    │  │   1:1    │  │
│  │          │  │          │  │          │  │          │  │
│  │ ┌──────┐ │  │ ┌──────┐ │  │ ┌──────┐ │  │ ┌──────┐ │  │
│  │ │Catego│ │  │ │Catego│ │  │ │Catego│ │  │ │Catego│ │  │
│  │ │ -ry  │ │  │ │ -ry  │  │ │ -ry  │  │ │ -ry  │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
│                                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │          │  │          │  │          │  │          │  │
│  │  Image   │  │  Image   │  │ Loading  │  │  Error   │  │
│  │   1:1    │  │   1:1    │  │ [Shimmer]│  │  State   │  │
│  │          │  │          │  │    ⟳     │  │    ⚠️     │  │
│  │ ┌──────┐ │  │ ┌──────┐ │  │          │  │Không thể │  │
│  │ │Catego│ │  │ │Catego│ │  │          │  │ tải ảnh  │  │
│  │ │ -ry  │ │  │ │ -ry  │ │  │          │  │          │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
│                                                             │
└─────────────────────────────────────────────────────────────┘

Features:
- Rounded corners (12px)
- Pink shadow (opacity 0.3, blur 8px)
- Category badge at bottom (semi-transparent black)
- Tap anywhere on thumbnail to open lightbox
- Staggered fade-in animation (50ms delay per item)
- Scale from 0.9 to 1.0 on load
```

## Lightbox Viewer (Full Screen)

```
┌─────────────────────────────────────────────────────────────┐
│ ┌────────┐                                       ┌────┐   │ ← Top Bar
│ │ 3/12   │                                       │ ✕  │   │
│ └────────┘                                       └────┘   │
│                                                             │
│                                                             │
│                      ┌─────────────┐                       │
│                      │             │                       │
│  ←                   │             │                    →  │ ← Nav Arrows
│ Prev                 │   Image     │                  Next │
│                      │  (Zoomable) │                       │
│                      │             │                       │
│                      │             │                       │
│                      └─────────────┘                       │
│                                                             │
│               ┌───────────────────────────┐               │ ← Caption
│               │ Khoảnh khắc ngọt ngào... │               │
│               └───────────────────────────┘               │
│                                                             │
└─────────────────────────────────────────────────────────────┘

Features:
- Black background (full opacity)
- Close button (X) - Top right, 48x48, semi-transparent
- Counter - Top left, shows current/total
- Previous button (←) - Left center, 48x48, shows when not at first
- Next button (→) - Right center, 48x48, shows when not at last
- Caption - Bottom center, optional, semi-transparent
- Tap image area to close
- Swipe left/right to navigate
- Pinch to zoom (0.5x to 4x)
- Hero animation from thumbnail
```

## Responsive Breakpoints

### Mobile (< 600px)
```
┌───────────────────────┐
│  Title                │
│                       │
│  ┌─────┐   ┌─────┐  │
│  │ Img │   │ Img │  │
│  └─────┘   └─────┘  │
│                       │
│  ┌─────┐   ┌─────┐  │
│  │ Img │   │ Img │  │
│  └─────┘   └─────┘  │
│                       │
└───────────────────────┘
2 columns, 16px padding
```

### Tablet (600-899px)
```
┌─────────────────────────────────┐
│  Title                          │
│                                 │
│  ┌─────┐  ┌─────┐  ┌─────┐    │
│  │ Img │  │ Img │  │ Img │    │
│  └─────┘  └─────┘  └─────┘    │
│                                 │
│  ┌─────┐  ┌─────┐  ┌─────┐    │
│  │ Img │  │ Img │  │ Img │    │
│  └─────┘  └─────┘  └─────┘    │
│                                 │
└─────────────────────────────────┘
3 columns, 48px padding
```

### Desktop (≥ 900px)
```
┌───────────────────────────────────────────────┐
│  Title                                        │
│                                               │
│  ┌─────┐  ┌─────┐  ┌─────┐  ┌─────┐         │
│  │ Img │  │ Img │  │ Img │  │ Img │         │
│  └─────┘  └─────┘  └─────┘  └─────┘         │
│                                               │
│  ┌─────┐  ┌─────┐  ┌─────┐  ┌─────┐         │
│  │ Img │  │ Img │  │ Img │  │ Img │         │
│  └─────┘  └─────┘  └─────┘  └─────┘         │
│                                               │
└───────────────────────────────────────────────┘
4 columns, 48px padding
```

## Loading States

### Thumbnail Loading
```
┌──────────┐
│          │
│    ⟳     │ ← Circular progress indicator
│ [Shimmer]│    (Pink color)
│          │    With shimmer animation
│          │    (1500ms loop)
│          │
└──────────┘
Pink background (shade 50)
```

### Lightbox Loading
```
┌───────────────┐
│               │
│               │
│      ⟳ 45%   │ ← Progress indicator
│               │    Shows percentage when available
│               │    White color
│               │
└───────────────┘
```

## Error States

### Thumbnail Error
```
┌──────────┐
│          │
│    🖼️    │ ← Image not supported icon
│          │    (Pink shade 200)
│ Không thể│
│ tải ảnh  │    Vietnamese error message
│          │
└──────────┘
Pink background (shade 50)
```

### Lightbox Error
```
┌───────────────┐
│               │
│               │
│      ⚠️       │ ← Error icon (white, 64px)
│               │
│ Không thể     │    Vietnamese error message
│   tải ảnh     │    (White, 16px)
│               │
└───────────────┘
Dark gray background (shade 900)
```

## Color Palette

```
Primary Colors:
┌──────────────┐
│ Colors.pink. │
│  shade700    │ ← Title text
└──────────────┘

┌──────────────┐
│ Colors.pink. │
│  shade400    │ ← Accents
└──────────────┘

┌──────────────┐
│ Colors.pink. │
│  shade200-300│ ← Shadows, loading
└──────────────┘

┌──────────────┐
│ Colors.pink. │
│   shade50    │ ← Backgrounds
└──────────────┘

Lightbox Colors:
┌──────────────┐
│ Colors.black │ ← Background
└──────────────┘

┌──────────────┐
│ Black @0.5-  │
│  0.7 opacity │ ← UI overlays
└──────────────┘

┌──────────────┐
│ Colors.white │ ← Text & icons
└──────────────┘
```

## Interaction Flow

```
1. User sees grid of thumbnails
   ↓
2. Tap on thumbnail
   ↓
3. Hero animation to fullscreen
   ↓
4. Lightbox opens with image
   ↓
5. User can:
   - Swipe left/right (navigate)
   - Tap arrows (navigate)
   - Pinch to zoom (0.5x - 4x)
   - Tap image (close)
   - Tap X button (close)
   ↓
6. Hero animation back to grid
```

## Animation Timeline

```
Thumbnail Fade-in:
Item 0:  100ms ▂▂▂▂▂▂▂▂████████
Item 1:  150ms      ▂▂▂▂▂▂▂▂████████
Item 2:  200ms          ▂▂▂▂▂▂▂▂████████
Item 3:  250ms              ▂▂▂▂▂▂▂▂████████
...
Duration: 500ms + (index × 50ms)

Shimmer Effect:
0ms    750ms  1500ms  2250ms
 ▓▓▓▓▓░░░░░▓▓▓▓▓░░░░░▓▓▓▓▓
Loop continuously during loading

Hero Transition:
Thumbnail → Lightbox: ~300ms
Lightbox → Thumbnail: ~300ms
Smooth scale + position animation

Page Navigation:
Previous/Next: 300ms ease-in-out
Smooth slide between images
```

## Touch Targets

All interactive elements meet minimum 48x48 accessibility requirement:

```
Close button:    48×48 ✅
Previous arrow:  48×48 ✅
Next arrow:      48×48 ✅
Thumbnails:      Variable size (always > 48×48) ✅
```

## Grid Spacing

```
┌───┐ 12px ┌───┐ 12px ┌───┐ 12px ┌───┐
│ 1 │◄────►│ 2 │◄────►│ 3 │◄────►│ 4 │
└───┘      └───┘      └───┘      └───┘
  ▲          ▲          ▲
  │ 12px    │ 12px    │ 12px
  ▼          ▼          ▼
┌───┐      ┌───┐      ┌───┐      ┌───┐
│ 5 │      │ 6 │      │ 7 │      │ 8 │
└───┘      └───┘      └───┘      └───┘

crossAxisSpacing: 12px
mainAxisSpacing: 12px
```

## Example Integration

```dart
// In your wedding invitation page:

Column(
  children: [
    HeroSection(...),           // Header with couple names
    StoryTimelineSection(...),  // Love story timeline
    GallerySection(             // ← Photo gallery
      images: weddingPhotos,
      title: 'Album Ảnh Cưới',
    ),
    // Other sections...
  ],
)
```

This visual guide helps understand the widget's appearance and behavior without running the actual Flutter app.
