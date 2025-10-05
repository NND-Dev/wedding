import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// Message section for guest wishes and QR banking
class MessageSection extends StatefulWidget {
  final String? bankingQRData;
  final String? bankAccountInfo;
  final EdgeInsets? padding;
  final Function(String name, String message)? onMessageSubmit;

  const MessageSection({
    Key? key,
    this.bankingQRData,
    this.bankAccountInfo,
    this.padding,
    this.onMessageSubmit,
  }) : super(key: key);

  @override
  State<MessageSection> createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitMessage() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    // Simulate submission delay
    await Future.delayed(const Duration(seconds: 1));

    if (widget.onMessageSubmit != null) {
      widget.onMessageSubmit!(_nameController.text, _messageController.text);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Cảm ơn bạn đã gửi lời chúc!'),
            ],
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Clear form
      _nameController.clear();
      _messageController.clear();
      _formKey.currentState!.reset();
    }

    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Center(
                child: Text(
                  'Gửi Lời Chúc',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.pink.shade700,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms)
              .slide(begin: const Offset(0, -0.3), end: Offset.zero),

          const SizedBox(height: 32),

          // Message Form and Banking QR in responsive layout
          isMobile
              ? Column(
                  children: [
                    _buildMessageForm(isMobile),
                    if (widget.bankingQRData != null) ...[
                      const SizedBox(height: 32),
                      _buildBankingQR(isMobile),
                    ],
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildMessageForm(isMobile)),
                    if (widget.bankingQRData != null) ...[
                      const SizedBox(width: 32),
                      Expanded(flex: 2, child: _buildBankingQR(isMobile)),
                    ],
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildMessageForm(bool isMobile) {
    return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.pink.shade50.withValues(alpha: 0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Form Title
                    Text(
                      'Viết lời chúc của bạn',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.pink.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 18 : 20,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Name Field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Tên của bạn *',
                        hintText: 'Nhập tên của bạn',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.pink.shade400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.pink.shade400,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Vui lòng nhập tên của bạn';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Message Field
                    TextFormField(
                      controller: _messageController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Lời chúc *',
                        hintText: 'Gửi lời chúc đến cô dâu chú rể...',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Icon(
                            Icons.message,
                            color: Colors.pink.shade400,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.pink.shade400,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Vui lòng nhập lời chúc';
                        }
                        if (value.trim().length < 10) {
                          return 'Lời chúc quá ngắn (tối thiểu 10 ký tự)';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // Submit Button
                    ElevatedButton(
                      onPressed: _isSubmitting ? null : _submitMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade400,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 14 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.send),
                                const SizedBox(width: 8),
                                Text(
                                  'Gửi lời chúc',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: 300.ms, duration: 600.ms)
        .slide(begin: const Offset(-0.2, 0), end: Offset.zero);
  }

  Widget _buildBankingQR(bool isMobile) {
    return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  const Color(0xFFFFC107).withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                children: [
                  // QR Title
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.qr_code,
                          color: Color(0xFFFFC107),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Mừng cưới',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.pink.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 18 : 20,
                              ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // QR Code
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.shade100,
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: QrImageView(
                      data: widget.bankingQRData!,
                      version: QrVersions.auto,
                      size: isMobile ? 180 : 200,
                      backgroundColor: Colors.white,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Bank Info
                  if (widget.bankAccountInfo != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC107).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.bankAccountInfo!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: isMobile ? 12 : 14,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  const SizedBox(height: 12),

                  // Instructions
                  Text(
                    'Quét mã QR để gửi mừng cưới',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                      fontSize: isMobile ? 12 : 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: 400.ms, duration: 600.ms)
        .slide(begin: const Offset(0.2, 0), end: Offset.zero);
  }
}
