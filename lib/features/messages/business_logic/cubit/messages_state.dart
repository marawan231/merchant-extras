import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_state.freezed.dart';

@freezed
class MessagesState<T> with _$MessagesState<T> {
  const factory MessagesState.idel() = Idle<T>;
  const factory MessagesState.negotiationsSentView() = NegotiationsSentView<T>;
  const factory MessagesState.negotiationsOnMyDeals() =
      NegotiationsOnMyDeals<T>;

        const factory MessagesState.chatsView() =ChatsView<T>;
        const factory MessagesState.back() = Back<T>;


  // const factory MessagesState.sellerTheme() = SellerTheme<T>;
}
