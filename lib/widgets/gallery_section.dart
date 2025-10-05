import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Gallery image model
class GalleryImage {
  final String url;
  final String category;
  final String? title;
  final String? description;

  const GalleryImage({
    required this.url,
    required this.category,
    this.title,
    this.description,
  });
}

/// Gallery categories
enum GalleryCategory {
  all('Tất cả'),
  preWedding('Pre-wedding'),
  engagement('Đính hôn'),
  family('Gia đình');

  final String label;
  const GalleryCategory(this.label);
}

/// Gallery Section Widget - Displays wedding photo album with lightbox viewer
class GallerySection extends StatefulWidget {
  final List<GalleryImage> images;
  final EdgeInsets? padding;
  final String title;

  const GallerySection({
    Key? key,
    required this.images,
    this.padding,
    this.title = 'Album Ảnh Cưới',
  }) : super(key: key);

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  String _selectedCategory = GalleryCategory.all.label;

  List<GalleryImage> get _filteredImages {
    if (_selectedCategory == GalleryCategory.all.label) {
      return widget.images;
    }
    return widget.images
        .where((img) => img.category == _selectedCategory)
        .toList();
  }

  void _openLightbox(int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: _LightboxViewer(
              images: _filteredImages,
              initialIndex: index,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final crossAxisCount = isMobile ? 2 : (screenWidth < 900 ? 3 : 4);

    return Container(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.pink.shade700,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript',
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms)
              .slide(begin: const Offset(0, -0.3), end: Offset.zero),

          const SizedBox(height: 24),

          // Category Tabs
          SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: GalleryCategory.values.map((category) {
                    final isSelected = _selectedCategory == category.label;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _CategoryChip(
                        label: category.label,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            _selectedCategory = category.label;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              )
              .animate()
              .fadeIn(delay: 300.ms, duration: 500.ms)
              .slide(begin: const Offset(-0.2, 0), end: Offset.zero),

          const SizedBox(height: 32),

          // Gallery Grid
          _filteredImages.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Text(
                      'Không có ảnh trong danh mục này',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _filteredImages.length,
                  itemBuilder: (context, index) {
                    return _GalleryThumbnail(
                      image: _filteredImages[index],
                      index: index,
                      onTap: () => _openLightbox(index),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

/// Category filter chip
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade400 : Colors.pink.shade50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.pink.shade400 : Colors.pink.shade200,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.pink.shade700,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

/// Gallery thumbnail with Hero animation
class _GalleryThumbnail extends StatelessWidget {
  final GalleryImage image;
  final int index;
  final VoidCallback onTap;

  const _GalleryThumbnail({
    Key? key,
    required this.image,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: 'gallery_image_$index',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image with loading placeholder
              Image.network(
                image.url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.pink.shade50,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.pink.shade300,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.pink.shade50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image,
                          color: Colors.pink.shade200,
                          size: 48,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Không tải được',
                          style: TextStyle(
                            color: Colors.pink.shade300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(delay: (300 + index * 50).ms, duration: 500.ms),
    );
  }
}

/// Lightbox viewer with swipe navigation
class _LightboxViewer extends StatefulWidget {
  final List<GalleryImage> images;
  final int initialIndex;

  const _LightboxViewer({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<_LightboxViewer> createState() => _LightboxViewerState();
}

class _LightboxViewerState extends State<_LightboxViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _closeLightbox() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // PageView for swipeable images
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: _closeLightbox,
                child: Center(
                  child: Hero(
                    tag: 'gallery_image_$index',
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 4.0,
                      child: Image.network(
                        widget.images[index].url,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              color: Colors.pink.shade300,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.pink.shade50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.broken_image,
                                  color: Colors.pink.shade200,
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Không tải được ảnh',
                                  style: TextStyle(
                                    color: Colors.pink.shade300,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Close button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 32),
              onPressed: _closeLightbox,
            ),
          ),

          // Navigation arrows (only show if more than 1 image)
          if (widget.images.length > 1) ...[
            // Left arrow
            if (_currentIndex > 0)
              Positioned(
                left: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 48,
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),

            // Right arrow
            if (_currentIndex < widget.images.length - 1)
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 48,
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
          ],

          // Indicator dots
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.pink.shade400
                        : Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ),

          // Image info (title/description) if available
          if (widget.images[_currentIndex].title != null ||
              widget.images[_currentIndex].description != null)
            Positioned(
              bottom: 80,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.images[_currentIndex].title != null)
                      Text(
                        widget.images[_currentIndex].title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (widget.images[_currentIndex].description != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        widget.images[_currentIndex].description!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
