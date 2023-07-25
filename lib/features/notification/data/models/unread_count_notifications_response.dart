class UnreadCountResponse {
  UnreadCountResponse({
    int? unreadCount,
  }) {
    _unreadCount = unreadCount;
  }

  UnreadCountResponse.fromJson(dynamic json) {
    _unreadCount = json['unread_notifications'];
  }

  int? _unreadCount;

  int? get unreadCount => _unreadCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unread_notifications'] = _unreadCount;
    return map;
  }
}
