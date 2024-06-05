import 'package:bloc/bloc.dart';
import 'package:sebek_vpn/models/notification.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit()
      : super(NotificationsState([]));

  loadList(List<Notify> notifications) {
    print(notifications.length);
    emit(NotificationsState(notifications));
  }
}
