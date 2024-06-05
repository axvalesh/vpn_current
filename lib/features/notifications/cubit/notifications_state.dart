part of 'notifications_cubit.dart';

class NotificationsState {
  final List<Notify> notifications;

  NotificationsState(this.notifications);

  // NotificationsState copyWith({List<NotificationModel>? notifications}) {
  //   return NotificationsState(notifications ?? this.notifications);
  // }

  bool get unseen => notifications.any((n) => n.seen == false);
}
