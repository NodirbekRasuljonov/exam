import 'package:bloc/bloc.dart';
import 'package:exam/views/profile/view/menus/notifications/state/notification_state.dart';

class NotificationCubit extends Cubit<NotificatoinState> {
  NotificationCubit() : super(NotificationInitialState());

  bool inAppNot = false;
  bool newPromo = false;
  bool tips = false;
  bool update = false;

  void changeTile(
      {required bool v, required bool value, required String title}) {
    if (title == 'In App Notification') {
      inAppNot = v;
      emit(NotificationInitialState());
    }
    else if (title == 'New Promo') {
      newPromo = v;
      emit(NotificationInitialState());
    }
    else if (title == 'Tips & trick') {
      tips = v;
      emit(NotificationInitialState());
    }
    else if (title == 'Update Application') {
      update = v;
      emit(NotificationInitialState());
    }
  }
}
