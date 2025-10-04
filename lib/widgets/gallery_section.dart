import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Represents a single image in the gallery with metadata
class GalleryImage {
  final String imageUrl;
  final String category;
  final String? caption;

  const GalleryImage({
    required this.imageUrl,
    required this.category,
    this.caption,
  });
}

/// Gallery Section widget displaying wedding photos in a responsive grid with lightbox viewer
class GallerySection extends StatelessWidget {
  final List<GalleryImage> images;
  final EdgeInsets? padding;
  final String? title;

  const GallerySection({
    Key? key,
    required this.images,
    this.padding,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final crossAxisCount = isMobile ? 2 : (screenWidth < 900 ? 3 : 4);

    return Container(
      padding: padding ?? EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          if (title != null)
            Text(
              title!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.pink.shade700,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: -0.3, end: 0),
          
          if (title != null) const SizedBox(height: 24),
          
          // Gallery Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _GalleryThumbnail(
                image: images[index],
                index: index,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => _LightboxViewer(
                        images: images,
                        initialIndex: index,
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Thumbnail widget for gallery grid items
class _GalleryThumbnail extends StatefulWidget {
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
  State<_GalleryThumbnail> createState() => _GalleryThumbnailState();
}

class _GalleryThumbnailState extends State<_GalleryThumbnail> {
  bool _isLoading = true;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'gallery-image-${widget.index}',
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade200.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Loading placeholder
                if (_isLoading)
                  Container(
                    color: Colors.pink.shade50,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.pink.shade300,
                        ),
                      ),
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(
                    duration: 1500.ms,
                    color: Colors.white.withOpacity(0.3),
                  ),
                
                // Image
                if (!_hasError)
                  Image.network(
                    widget.image.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        });
                        return child;
                      }
                      return const SizedBox.shrink();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          setState(() {
                            _hasError = true;
                            _isLoading = false;
                          });
                        }
                      });
                      return const SizedBox.shrink();
                    },
                  ),
                
                // Error placeholder
                if (_hasError)
                  Container(
                    color: Colors.pink.shade50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          color: Colors.pink.shade200,
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Không thể tải ảnh',
                          style: TextStyle(
                            color: Colors.pink.shade300,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                
                // Category badge
                if (!_hasError)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.image.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    )
    .animate()
    .fadeIn(delay: (100 + widget.index * 50).ms, duration: 500.ms)
    .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }
}

/// Full-screen lightbox image viewer with navigation
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

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PageView for swipeable images
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Hero(
                    tag: 'gallery-image-$index',
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.network(
                        widget.images[index].imageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade900,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.white.withOpacity(0.7),
                                  size: 64,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Không thể tải ảnh',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
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
            child: Material(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
          
          // Image counter
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_currentIndex + 1}/${widget.images.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          
          // Previous button
          if (_currentIndex > 0)
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: Material(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    onTap: _goToPrevious,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          
          // Next button
          if (_currentIndex < widget.images.length - 1)
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: Material(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    onTap: _goToNext,
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          
          // Caption (if available)
          if (widget.images[_currentIndex].caption != null)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.images[_currentIndex].caption!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
