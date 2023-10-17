// To parse this JSON data, do
//
//     final getEvent = getEventFromJson(jsonString);

import 'dart:convert';

List<GetEvent> getEventFromJson(String str) => List<GetEvent>.from(json.decode(str).map((x) => GetEvent.fromJson(x)));

String getEventToJson(List<GetEvent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetEvent {
  int id;
  String eventName;
  DateTime createdAt;
  DateTime updatedAt;
  String startedAt;
  String endedAt;
  String startTime;
  String endTime;
  String location;
  String featuredImage;
  String logo;
  int isCloning;
  String cloningProcess;
  String cloningStartedAt;
  dynamic ticketId;
  int offlineTickets;
  int ccTickets;
  int totalBookings;
  List<dynamic> pageDetails;

  GetEvent({
    required this.id,
    required this.eventName,
    required this.createdAt,
    required this.updatedAt,
    required this.startedAt,
    required this.endedAt,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.featuredImage,
    required this.logo,
    required this.isCloning,
    required this.cloningProcess,
    required this.cloningStartedAt,
    required this.ticketId,
    required this.offlineTickets,
    required this.ccTickets,
    required this.totalBookings,
    required this.pageDetails,
  });

  factory GetEvent.fromJson(Map<String, dynamic> json) => GetEvent(
    id: json["id"],
    eventName: json["event_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    startedAt: json["started_at"],
    endedAt: json["ended_at"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    location: json["location"],
    featuredImage: json["featured_image"],
    logo: json["logo"],
    isCloning: json["is_cloning"],
    cloningProcess: json["cloning_process"],
    cloningStartedAt: json["cloning_started_at"],
    ticketId: json["ticket_id"],
    offlineTickets: json["offline_tickets"],
    ccTickets: json["cc_tickets"],
    totalBookings: json["total_bookings"],
    pageDetails: List<dynamic>.from(json["page_details"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_name": eventName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "started_at": startedAt,
    "ended_at": endedAt,
    "start_time": startTime,
    "end_time": endTime,
    "location": location,
    "featured_image": featuredImage,
    "logo": logo,
    "is_cloning": isCloning,
    "cloning_process": cloningProcess,
    "cloning_started_at": cloningStartedAt,
    "ticket_id": ticketId,
    "offline_tickets": offlineTickets,
    "cc_tickets": ccTickets,
    "total_bookings": totalBookings,
    "page_details": List<dynamic>.from(pageDetails.map((x) => x)),
  };
}
