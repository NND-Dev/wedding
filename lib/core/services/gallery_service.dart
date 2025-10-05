import 'package:wedding_invitation_app/widgets/gallery_section.dart';

/// Service for managing gallery data and operations
class GalleryService {
  List<GalleryImage> _images = [];

  /// Get all gallery images
  List<GalleryImage> get images => List.unmodifiable(_images);

  /// Set gallery images
  void setImages(List<GalleryImage> images) {
    _images = images;
  }

  /// Add a single image
  void addImage(GalleryImage image) {
    _images.add(image);
  }

  /// Remove an image
  void removeImage(GalleryImage image) {
    _images.remove(image);
  }

  /// Filter images by category
  List<GalleryImage> getImagesByCategory(String category) {
    if (category.toLowerCase() == 'tất cả' || category.toLowerCase() == 'all') {
      return images;
    }
    return _images.where((image) => image.category == category).toList();
  }

  /// Get all unique categories
  List<String> getCategories() {
    final categories = <String>{'Tất cả'};
    for (final image in _images) {
      categories.add(image.category);
    }
    return categories.toList();
  }

  /// Get sample gallery data
  List<GalleryImage> getSampleGalleryData() {
    return const [
      GalleryImage(
        url:
            'https://images.unsplash.com/photo-1519741497674-611481863552?w=800',
        category: 'Pre-wedding',
        title: 'Pre-wedding shoot',
        description: 'Bộ ảnh cưới của chúng tôi',
      ),
      GalleryImage(
        url:
            'https://images.unsplash.com/photo-1606216794074-735e91aa2c92?w=800',
        category: 'Pre-wedding',
        title: 'Romantic moments',
      ),
      GalleryImage(
        url:
            'https://images.unsplash.com/photo-1591604466107-ec97de577aff?w=800',
        category: 'Đính hôn',
        title: 'Engagement ceremony',
        description: 'Lễ đính hôn ấm cúng',
      ),
      GalleryImage(
        url:
            'https://images.unsplash.com/photo-1583939003579-730e3918a45a?w=800',
        category: 'Gia đình',
        title: 'Family gathering',
      ),
      GalleryImage(
        url:
            'https://images.unsplash.com/photo-1573495627361-d9b87960b12d?w=800',
        category: 'Pre-wedding',
        title: 'Love in the air',
      ),
      GalleryImage(
        url:
            'https://images.unsplash.com/photo-1522673607200-164d1b6ce486?w=800',
        category: 'Gia đình',
        title: 'With family',
        description: 'Gia đình là điều quan trọng nhất',
      ),
    ];
  }

  /// Clear all images
  void clearImages() {
    _images.clear();
  }
}
