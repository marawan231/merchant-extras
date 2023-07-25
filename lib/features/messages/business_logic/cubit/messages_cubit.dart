import 'package:bloc/bloc.dart';
import '../../../../core/resources/constants.dart';

import 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(const MessagesState.idel());

  int defaultMessagesCategories = 0;

  backTo(index) {
    screenIndex = index;
    emit(const MessagesState.back());
  }

  void goToChatsView() {
    screenIndex = 9;
    emit(const MessagesState.chatsView());
  }

  void showSelectedView() {
    if (defaultMessagesCategories == 0) {
      emit(const MessagesState.negotiationsSentView());
    }

    if (defaultMessagesCategories == 1) {
      emit(const MessagesState.negotiationsOnMyDeals());
    }
  }
}
