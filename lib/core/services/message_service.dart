import 'package:flutter/foundation.dart';

/// Model for wedding messages
class WeddingMessage {
  final String id;
  final String senderName;
  final String message;
  final DateTime timestamp;

  const WeddingMessage({
    required this.id,
    required this.senderName,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderName': senderName,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory WeddingMessage.fromJson(Map<String, dynamic> json) {
    return WeddingMessage(
      id: json['id'] as String,
      senderName: json['senderName'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

/// Service for managing wedding messages
class MessageService {
  final List<WeddingMessage> _messages = [];

  /// Get all messages
  List<WeddingMessage> get messages => List.unmodifiable(_messages);

  /// Add a new message
  Future<bool> addMessage(String senderName, String message) async {
    try {
      final newMessage = WeddingMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderName: senderName,
        message: message,
        timestamp: DateTime.now(),
      );

      _messages.add(newMessage);

      // In a real app, you would save to a backend or local storage
      await _saveToStorage(newMessage);

      return true;
    } catch (e) {
      // Log error in production
      debugPrint('Error adding message: $e');
      return false;
    }
  }

  /// Get messages count
  int get messageCount => _messages.length;

  /// Get recent messages (limit)
  List<WeddingMessage> getRecentMessages({int limit = 10}) {
    final sortedMessages = List<WeddingMessage>.from(_messages)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return sortedMessages.take(limit).toList();
  }

  /// Clear all messages
  void clearMessages() {
    _messages.clear();
  }

  /// Private method to simulate saving to storage
  Future<void> _saveToStorage(WeddingMessage message) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // In production, implement actual storage logic:
    // - Save to Firestore
    // - Save to local SQLite
    // - Send to REST API
    debugPrint('Message saved: ${message.senderName} - ${message.message}');
  }

  /// Load messages from storage (called on app start)
  Future<void> loadMessages() async {
    try {
      // In production, load from actual storage
      // For now, we'll just simulate loading
      await Future.delayed(const Duration(milliseconds: 300));
      debugPrint('Messages loaded: ${_messages.length} messages');
    } catch (e) {
      debugPrint('Error loading messages: $e');
    }
  }
}
