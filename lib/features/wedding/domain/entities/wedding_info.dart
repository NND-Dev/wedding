import 'package:equatable/equatable.dart';

class WeddingInfo extends Equatable {
  final String brideName;
  final String groomName;
  final DateTime weddingDate;
  final String ceremonyVenue;
  final String ceremonyAddress;
  final String receptionVenue;
  final String receptionAddress;
  final String ceremonyTime;
  final String receptionTime;
  final String? backgroundImageUrl;
  final String? coupleImageUrl;
  final String loveStory;
  final List<TimelineEvent> timeline;

  const WeddingInfo({
    required this.brideName,
    required this.groomName,
    required this.weddingDate,
    required this.ceremonyVenue,
    required this.ceremonyAddress,
    required this.receptionVenue,
    required this.receptionAddress,
    required this.ceremonyTime,
    required this.receptionTime,
    this.backgroundImageUrl,
    this.coupleImageUrl,
    required this.loveStory,
    required this.timeline,
  });

  @override
  List<Object?> get props => [
        brideName,
        groomName,
        weddingDate,
        ceremonyVenue,
        ceremonyAddress,
        receptionVenue,
        receptionAddress,
        ceremonyTime,
        receptionTime,
        backgroundImageUrl,
        coupleImageUrl,
        loveStory,
        timeline,
      ];
}

class TimelineEvent extends Equatable {
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;

  const TimelineEvent({
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [title, description, date, imageUrl];
}