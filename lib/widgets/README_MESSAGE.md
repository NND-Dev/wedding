# MessageSection Widget

## Overview
The `MessageSection` widget provides functionality for guests to send their wishes to the couple and displays a QR code for wedding gifts (banking QR).

## Features
- ✅ Guest wish form with name and message fields
- ✅ Form validation
- ✅ QR code display for banking/mừng cưới
- ✅ Responsive layout (mobile and desktop)
- ✅ Smooth animations with flutter_animate
- ✅ Success feedback after submission
- ✅ Beautiful gradient card design

## Usage

```dart
import 'package:wedding_invitation_app/widgets/message_section.dart';

MessageSection(
  bankingQRData: 'https://example.com/banking-qr', // QR code data
  bankAccountInfo: 'MB Bank - 0123456789\nNGUYỄN VĂN A', // Bank account info
  onMessageSubmit: (name, message) {
    // Handle message submission
    print('Message from $name: $message');
  },
)
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `bankingQRData` | `String?` | No | Data for the banking QR code |
| `bankAccountInfo` | `String?` | No | Bank account information to display |
| `padding` | `EdgeInsets?` | No | Custom padding for the section |
| `onMessageSubmit` | `Function(String, String)?` | No | Callback when message is submitted |

## Layout

### Mobile (< 600px)
- Stacked layout: Form on top, QR code below
- Optimized spacing and font sizes

### Desktop (≥ 600px)
- Side-by-side layout: Form (60%) and QR code (40%)
- Larger fonts and spacing

## Form Validation
- **Name field**: Required, cannot be empty
- **Message field**: Required, minimum 10 characters

## Styling
- Uses theme colors (pink shades)
- Gradient backgrounds
- Elevated cards with shadows
- Smooth animations on mount

## Dependencies
- `flutter_animate`: For smooth entrance animations
- `qr_flutter`: For QR code generation
