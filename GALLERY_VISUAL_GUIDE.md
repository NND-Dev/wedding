# GallerySection Widget - Visual Guide

## 📸 Component Overview

This document provides a visual representation of the GallerySection widget structure and behavior.

## 🎨 Grid Layout Visualization

### Mobile Layout (< 600px) - 2 Columns
```
┌─────────────────────────────────────┐
│  Album Ảnh Cưới                     │
│                                     │
│  ┌──────────┐  ┌──────────┐       │
│  │  Image 1 │  │  Image 2 │       │
│  │    1:1   │  │    1:1   │       │
│  └──────────┘  └──────────┘       │
│                                     │
│  ┌──────────┐  ┌──────────┐       │
│  │  Image 3 │  │  Image 4 │       │
│  │    1:1   │  │    1:1   │       │
│  └──────────┘  └──────────┘       │
│                                     │
│  ┌──────────┐  ┌──────────┐       │
│  │  Image 5 │  │  Image 6 │       │
│  │    1:1   │  │    1:1   │       │
│  └──────────┘  └──────────┘       │
└─────────────────────────────────────┘
```

### Tablet Layout (600-899px) - 3 Columns
```
┌────────────────────────────────────────────────────┐
│  Album Ảnh Cưới                                    │
│                                                    │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐          │
│  │ Image 1 │  │ Image 2 │  │ Image 3 │          │
│  │   1:1   │  │   1:1   │  │   1:1   │          │
│  └─────────┘  └─────────┘  └─────────┘          │
│                                                    │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐          │
│  │ Image 4 │  │ Image 5 │  │ Image 6 │          │
│  │   1:1   │  │   1:1   │  │   1:1   │          │
│  └─────────┘  └─────────┘  └─────────┘          │
└────────────────────────────────────────────────────┘
```

### Desktop Layout (≥ 900px) - 4 Columns
```
┌─────────────────────────────────────────────────────────────────┐
│  Album Ảnh Cưới                                                 │
│                                                                 │
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐              │
│  │Image 1 │  │Image 2 │  │Image 3 │  │Image 4 │              │
│  │  1:1   │  │  1:1   │  │  1:1   │  │  1:1   │              │
│  └────────┘  └────────┘  └────────┘  └────────┘              │
│                                                                 │
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐              │
│  │Image 5 │  │Image 6 │  │Image 7 │  │Image 8 │              │
│  │  1:1   │  │  1:1   │  │  1:1   │  │  1:1   │              │
│  └────────┘  └────────┘  └────────┘  └────────┘              │
└─────────────────────────────────────────────────────────────────┘
```

## 🖼️ Thumbnail States

### Loading State
```
┌──────────────┐
│              │
│   ┌──────┐   │  ← Shimmer effect
│   │  ○   │   │  ← Circular progress
│   └──────┘   │
│              │
└──────────────┘
Pink background with shimmer animation
```

### Loaded State
```
┌──────────────┐
│              │
│    [Photo]   │  ← Actual image
│              │
└──────────────┘
Image displayed with rounded corners
```

### Error State
```
┌──────────────┐
│              │
│    ⚠️        │  ← Broken image icon
│  Không thể   │
│   tải ảnh    │
│              │
└──────────────┘
Pink background with error message
```

## 📱 Lightbox Viewer Layout

### Full Screen View
```
┌──────────────────────────────────────────────┐
│                                         [X]  │ ← Close button
│                                              │
│        ┌─────────────────────┐              │
│        │                     │              │
│  [◄]   │     Full Image      │   [►]        │ ← Navigation
│        │   (Zoomable via     │              │
│        │   InteractiveViewer)│              │
│        │                     │              │
│        └─────────────────────┘              │
│                                              │
│        ┌───────────────────┐                │
│        │ Image Title       │                │ ← Info box
│        │ Image description │                │   (if available)
│        └───────────────────┘                │
│                                              │
│              [ 1 / 10 ]                      │ ← Counter
└──────────────────────────────────────────────┘
Black background
```

### Swipe Gesture Zones
```
┌──────────────────────────────────────────────┐
│                                              │
│   ←←←←←             IMAGE           →→→→→   │
│   Swipe             Area            Swipe   │
│   Left                              Right   │
│   (Previous)                        (Next)  │
│                                              │
│   ← 50px threshold →     ← 50px threshold → │
└──────────────────────────────────────────────┘
```

## 🎭 Animation Sequence

### Thumbnail Entrance
```
Time:    0ms     200ms    250ms    300ms    350ms    400ms
         │        │        │        │        │        │
Image 1: [Fade + Scale In]─────────────────────────────
Image 2:          [Fade + Scale In]──────────────────────
Image 3:                   [Fade + Scale In]─────────────
Image 4:                            [Fade + Scale In]────
Image 5:                                     [Fade + Scale In]

Properties:
- Opacity: 0 → 1
- Scale: 0.8 → 1.0
- Duration: 500ms
- Stagger: 50ms per item
```

### Lightbox Opening (Hero Animation)
```
Thumbnail → Lightbox

Step 1: Tap thumbnail
        ┌──────┐
        │Photo │
        └──────┘

Step 2: Hero animation starts (automatic)
        ┌────────────┐
        │   Photo    │
        └────────────┘

Step 3: Expands to full screen
        ┌─────────────────────┐
        │                     │
        │       Photo         │
        │                     │
        └─────────────────────┘

Step 4: Lightbox controls fade in
        ┌─────────────────────┐ [X]
        │                     │
  [◄]   │       Photo         │  [►]
        │                     │
        └─────────────────────┘
              [ 1 / 10 ]
```

### Loading Shimmer Effect
```
Frame 1:        Frame 2:        Frame 3:
┌─────────┐     ┌─────────┐     ┌─────────┐
│▓▓░░░░░░░│     │░░▓▓░░░░░│     │░░░░▓▓░░░│
│▓▓░░░░░░░│  →  │░░▓▓░░░░░│  →  │░░░░▓▓░░░│
│▓▓░░░░░░░│     │░░▓▓░░░░░│     │░░░░▓▓░░░│
└─────────┘     └─────────┘     └─────────┘

Duration: 1500ms (repeating)
Color: White with 30% opacity
Direction: Left to right
```

## 🎨 Color Palette

### Wedding Theme Colors
```
┌─────────────────────────────────────────────────┐
│ Primary Pink (Titles)                           │
│ #C2185B ████████████████                        │
│                                                 │
│ Accent Pink (Loading)                           │
│ #F06292 ████████████████                        │
│                                                 │
│ Light Pink (Background)                         │
│ #FCE4EC ████████████████                        │
│                                                 │
│ Gold (Image Titles)                             │
│ #FFC107 ████████████████                        │
│                                                 │
│ Shadow Pink                                     │
│ #F8BBD0 ████████████████ (50% opacity)          │
└─────────────────────────────────────────────────┘
```

### Lightbox Colors
```
Background:      ████████████████ #000000 (100%)
Button BG:       ████████████████ #000000 (50% opacity)
Counter BG:      ████████████████ #000000 (70% opacity)
Info Box BG:     ████████████████ #000000 (70% opacity)
Text:            ████████████████ #FFFFFF (100%)
Gold Title:      ████████████████ #FFC107 (100%)
```

## 📏 Spacing & Measurements

### Grid Spacing
```
Mobile Layout:
┌─16px─┐
│      ┌──8px──┐      │
│  [Image] [Image]    │
│      └───────┘      │
│         8px         │
│  [Image] [Image]    │
└─16px─┘

Desktop Layout:
┌─48px─┐
│   ┌─16px─┐   ┌─16px─┐   ┌─16px─┐   │
│ [Img] [Img] [Img] [Img]             │
│   └──────┘   └──────┘   └──────┘   │
└─48px─┘
```

### Thumbnail Details
```
┌────────────────────────┐
│  12px border radius    │
│                        │
│     [Image Area]       │
│       1:1 ratio        │
│                        │
│  Shadow: 0,4px blur 8  │
└────────────────────────┘
```

### Lightbox Button Sizes
```
Close Button:          Navigation Button:
┌─────────────┐       ┌─────────────┐
│   12px pad  │       │   12px pad  │
│  ┌───────┐  │       │  ┌───────┐  │
│  │   X   │  │       │  │   ◄   │  │
│  │ 24px  │  │       │  │ 32px  │  │
│  └───────┘  │       │  └───────┘  │
│             │       │             │
└─────────────┘       └─────────────┘
Total: 48x48px        Total: 56x56px
Radius: 24px          Radius: 24px
```

## 🔄 User Interaction Flow

### Opening Lightbox
```
1. User sees grid    2. Taps image       3. Hero animation   4. Lightbox open
   ┌──┐┌──┐             ┌──┐┌──┐            ┌────┐            ┌──────────┐
   │  ││  │             │★ ││  │            │ ★  │        [X] │          │
   └──┘└──┘             └──┘└──┘            └────┘       [◄] │    ★     │[►]
   ┌──┐┌──┐             ┌──┐┌──┐               ↓             │          │
   │  ││  │             │  ││  │            expanding         └──────────┘
   └──┘└──┘             └──┘└──┘                                [1/10]
```

### Swipe Navigation
```
Swipe Right (Previous):          Swipe Left (Next):
┌──────────────┐                ┌──────────────┐
│   ←←←←←      │                │      →→→→→   │
│   Image 1    │   Swipe →      │   Image 2    │
│   [1/5]      │   ← Swipe      │   [2/5]      │
└──────────────┘                └──────────────┘
```

### Pinch to Zoom
```
Normal View:          Pinch Out:           Zoomed In:
┌────────────┐       ┌────────────┐       ┌──────────┐
│            │       │  ⟨  ⟩      │       │██████    │
│   Photo    │  →    │   Photo    │  →    │██████    │
│            │       │            │       │██Photo██ │
└────────────┘       └────────────┘       └██████────┘
   1.0x                1.5x                 2.0x
(Can zoom: 0.5x to 4.0x)
```

## 📊 Component Architecture

### Widget Tree Structure
```
GallerySection
├─ Column
│  ├─ Text (Title) [animated]
│  └─ GridView.builder
│     └─ _GalleryThumbnail (for each image)
│        ├─ GestureDetector (tap handler)
│        └─ Hero
│           └─ Container (shadow, radius)
│              └─ ClipRRect
│                 └─ Stack
│                    ├─ Loading placeholder
│                    ├─ Error placeholder
│                    ├─ Image.network
│                    └─ InkWell (ripple effect)
│
└─ Opens → _GalleryLightbox (Navigator.push)
           └─ Scaffold (black background)
              └─ GestureDetector (swipe handler)
                 └─ Stack
                    ├─ PageView.builder
                    │  └─ Hero
                    │     └─ InteractiveViewer
                    │        └─ Image.network
                    ├─ Close Button (Positioned)
                    ├─ Previous Button (Positioned)
                    ├─ Next Button (Positioned)
                    ├─ Image Counter (Positioned)
                    └─ Image Info (Positioned)
```

## 🎯 Responsive Breakpoints

```
Screen Width:     Layout:        Columns:    Spacing:    Padding:
─────────────────────────────────────────────────────────────────
0px   - 599px     Mobile         2           8px         16px
600px - 899px     Tablet         3           16px        48px
900px - ∞         Desktop        4           16px        48px
```

## ⚡ Performance Optimization

### Lazy Loading Flow
```
Initial State:          User Scrolls:        Image Loads:
┌─────────────┐        ┌─────────────┐      ┌─────────────┐
│ [Visible]   │        │ [Visible]   │      │ [Visible]   │
│ [Visible]   │        │ [Visible]   │      │ [Visible]   │
│ [Visible]   │   →    │ [Loading]   │  →   │ [Loaded]    │
│ ─────────   │        │ ─────────   │      │ [Loaded]    │
│ [Not Built] │        │ [Loading]   │      │ [Loaded]    │
│ [Not Built] │        │ [Not Built] │      │ ─────────   │
└─────────────┘        └─────────────┘      └─────────────┘

Only visible + nearby items are built (GridView.builder)
Images load on-demand (Image.network)
```

## 📝 State Management

### Thumbnail States
```
┌─────────────────┐
│  Initial State  │
│  _isLoading = T │
│  _hasError = F  │
└────────┬────────┘
         │
         ├─→ Image starts loading
         │   └─→ Show shimmer + progress
         │
         ├─→ Image loads successfully
         │   └─→ _isLoading = F
         │      └─→ Show image
         │
         └─→ Image fails to load
             └─→ _hasError = T
                └─→ _isLoading = F
                   └─→ Show error UI
```

### Lightbox States
```
┌────────────────────┐
│ PageView           │
│ _currentIndex = 0  │
└─────────┬──────────┘
          │
          ├─→ Swipe/Navigate
          │   └─→ onPageChanged
          │      └─→ setState(_currentIndex)
          │         └─→ Update counter
          │            └─→ Update buttons visibility
          │
          └─→ Tap Navigation Button
              └─→ previousPage() or nextPage()
                 └─→ Animated transition
                    └─→ onPageChanged triggered
```

## 🎊 Conclusion

The GallerySection widget provides a comprehensive, visually appealing solution for displaying wedding photo galleries with:

- **Responsive grid layouts** adapting to screen size
- **Smooth animations** throughout the user experience
- **Rich lightbox viewer** with zoom and navigation
- **Intuitive gestures** for natural interaction
- **Beautiful wedding theme** with pink, gold, and cream colors
- **Robust error handling** for reliable performance

All designed with the wedding invitation app aesthetic in mind! 💍📸✨
