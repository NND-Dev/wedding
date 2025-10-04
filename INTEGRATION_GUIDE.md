# Wedding Invitation Landing Page - Complete Integration

## Overview
This is a complete wedding invitation landing page built with Flutter. It integrates all necessary sections for a beautiful, production-ready wedding invitation website.

## 🎯 Features Implemented

### ✅ All Main Sections
1. **HeroSection** - Beautiful opening animation with card flip effect
2. **StoryTimelineSection** - Love story timeline with dates and descriptions
3. **WeddingDetailsSection** - Ceremony and reception details with map integration
4. **GallerySection** - Photo album with categories and lightbox viewer
5. **MessageSection** - Guest wishes form and QR code for wedding gifts

### ✅ Key Features
- **Responsive Design**: Optimized for both mobile and desktop
- **Smooth Animations**: Using flutter_animate for beautiful transitions
- **Interactive Elements**: Map integration, lightbox gallery, form validation
- **Modern UI**: Gradient cards, shadows, and pink/gold color scheme
- **Production Ready**: Complete with all necessary sections

## 📁 Project Structure

```
lib/
├── main.dart                           # Main app with full integration
├── widgets/
│   ├── hero_section.dart               # Opening animation section
│   ├── story_timeline_section.dart     # Love story timeline
│   ├── wedding_details_section.dart    # Venue and timing details
│   ├── gallery_section.dart            # Photo gallery with lightbox
│   ├── message_section.dart            # Guest wishes + QR banking
│   ├── README_GALLERY.md               # Gallery documentation
│   ├── README_MESSAGE.md               # Message section docs
│   ├── README_STORY_TIMELINE.md        # Timeline documentation
│   └── README_WEDDING_DETAILS.md       # Details section docs
├── features/
│   └── wedding/
│       └── domain/
│           └── entities/
│               └── wedding_info.dart   # Data models
└── core/
    ├── theme/
    │   └── app_theme.dart              # Theme configuration
    └── base/
        ├── base_widget.dart
        ├── base_entity.dart
        └── ...
```

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/NND-Dev/wedding.git
cd wedding
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For web
flutter run -d chrome

# For mobile
flutter run
```

## 🎨 Customization

### Update Wedding Information

Edit the `_weddingInfo` constant in `main.dart`:

```dart
final WeddingInfo _weddingInfo = const WeddingInfo(
  brideName: 'Your Bride Name',
  groomName: 'Your Groom Name',
  weddingDate: DateTime(2025, 10, 20),
  ceremonyVenue: 'Your Ceremony Venue',
  ceremonyAddress: 'Full Address',
  ceremonyTime: '09:00 AM, Saturday, 20/10/2025',
  receptionVenue: 'Your Reception Venue',
  receptionAddress: 'Full Address',
  receptionTime: '18:00 PM, Saturday, 20/10/2025',
  loveStory: 'Your love story...',
  timeline: [
    // Add your timeline events
  ],
);
```

### Update Gallery Images

Edit the `_galleryImages` list in `main.dart`:

```dart
final List<GalleryImage> _galleryImages = const [
  GalleryImage(
    url: 'your-image-url.jpg',
    category: 'Pre-wedding',
    title: 'Your title',
    description: 'Your description',
  ),
  // Add more images
];
```

### Update Banking QR Code

In the `MessageSection` widget initialization:

```dart
MessageSection(
  bankingQRData: 'your-banking-qr-data',
  bankAccountInfo: 'Bank Name - Account Number\nYOUR NAME',
  onMessageSubmit: _handleMessageSubmit,
),
```

## 📱 Responsive Breakpoints

- **Mobile**: < 600px width
- **Tablet**: 600px - 900px width  
- **Desktop**: > 900px width

Each section automatically adjusts its layout, spacing, and font sizes based on screen width.

## 🎭 Sections Details

### 1. HeroSection
- Automatic card opening animation
- Displays couple names and wedding date
- Pink gradient background
- 3D card flip effect

### 2. StoryTimelineSection
- Vertical timeline with dots and lines
- Each event shows date, title, and description
- Optional images for each event
- Staggered entrance animations

### 3. WeddingDetailsSection
- Two cards: Ceremony and Reception
- Each card shows time, venue, and address
- "Get Directions" button (opens maps)
- "Copy Address" button
- Icons and gradient styling

### 4. GallerySection
- Category filter tabs (All, Pre-wedding, Engagement, Family)
- Grid layout (2 columns on mobile, 3-4 on desktop)
- Lightbox viewer with swipe navigation
- Hero animations between grid and lightbox
- Image info display

### 5. MessageSection
- Guest wish form with validation
- Name field (required)
- Message field (min 10 chars)
- QR code for wedding gifts
- Bank account information display
- Success feedback on submission

## 🎨 Color Scheme

- **Primary**: Pink shades (#F48FB1, #F06292, #EC407A)
- **Accent**: Gold (#FFC107)
- **Background**: White with pink tints
- **Text**: Dark gray (#424242, #616161)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  qr_flutter: ^4.0.0           # QR code generation
  google_fonts: ^2.1.0         # Font support
  flutter_animate: ^1.0.0      # Animations
  responsive_framework: ^0.1.0  # Responsive helpers
  equatable: ^2.0.0            # Value equality
  dartz: ^0.10.0               # Functional programming
  url_launcher: ^6.1.0         # Open URLs/maps
```

## 🌐 Deployment

### GitHub Pages

1. Build for web:
```bash
flutter build web --release --base-href /wedding/
```

2. Deploy the `build/web` folder to GitHub Pages

### Firebase Hosting

1. Install Firebase CLI:
```bash
npm install -g firebase-tools
```

2. Initialize Firebase:
```bash
firebase init hosting
```

3. Build and deploy:
```bash
flutter build web --release
firebase deploy
```

## 🧪 Testing

The app is designed to work without backend integration for testing purposes. All data is defined in `main.dart`.

To test with real backend:
1. Implement the `_handleMessageSubmit` method to send data to your API
2. Load `_weddingInfo` and `_galleryImages` from your backend
3. Add loading states and error handling

## 📸 Screenshots

The app includes:
- Beautiful hero animation on load
- Smooth scrolling between sections
- Interactive gallery with lightbox
- Functional form with validation
- QR code display
- Floating "scroll to top" button

## 🎯 Performance

- Lazy loading images in gallery
- Optimized animations with flutter_animate
- ScrollView with controller for smooth navigation
- Responsive images with proper error handling

## 🤝 Contributing

This is a wedding invitation project. Feel free to:
- Report bugs
- Suggest improvements
- Submit pull requests
- Fork for your own wedding!

## 📄 License

This project is open source and available for personal use.

## 👰🤵 Credits

Created with ❤️ for a beautiful wedding celebration!

---

**Note**: Remember to replace all sample data (names, dates, images, QR codes) with your actual wedding information before deployment!
