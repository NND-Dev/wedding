import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatefulWidget {
  final String brideName;
  final String groomName;
  final DateTime weddingDate;
  
  const HeroSection({
    Key? key,
    required this.brideName,
    required this.groomName,
    required this.weddingDate,
  }) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool _isOpened = false;

  @override
  void initState() {
    super.initState();
    // Tự động mở thiệp sau 1 giây
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isOpened = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade100, Colors.pink.shade50],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          // Card Animation
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_isOpened ? -0.3 : 0),
              child: Card(
                elevation: 20,
                child: Container(
                  width: 320,
                  height: 450,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tên cặp đôi
                      Text(
                        '${widget.brideName} & ${widget.groomName}',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 2000.ms).scale(),
                      
                      SizedBox(height: 20),
                      
                      // Lời mời
                      Text(
                        'Trân trọng kính mời',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ).animate().fadeIn(delay: 2500.ms),
                      
                      SizedBox(height: 10),
                      
                      Text(
                        'đến dự lễ cưới của chúng tôi',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 3000.ms),
                      
                      SizedBox(height: 30),
                      
                      // Ngày cưới
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${widget.weddingDate.day}/${widget.weddingDate.month}/${widget.weddingDate.year}',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.pink,
                          ),
                        ),
                      ).animate().fadeIn(delay: 3500.ms).scale(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}