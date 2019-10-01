import 'package:diziet/platform_channels/constants.dart';
import 'package:flutter/services.dart';

import 'telephony_channel_messages.dart';

class TelephonyChannel {
  static const _channel = const BasicMessageChannel(
    CHANNEL_NAME_TELEPHONY,
    JSONMessageCodec(),
  );

  static TelephonyChannel instance = TelephonyChannel._();

  final Set<TelephonyChannelListener> _listeners =
      new Set<TelephonyChannelListener>();

  TelephonyChannel._() {
    _channel.setMessageHandler((msg) async {
      final message = TelephonyChannelMessage.fromJson(msg);
      if (message != null) {
        _publish(message);
      }
    });
  }

  static void addListener(TelephonyChannelListener listener) {
    instance._listeners.add(listener);
  }

  static void removeListener(TelephonyChannelListener listener) {
    instance._listeners.remove(listener);
  }

  static void send(TelephonyChannelMessage message) {
    _channel.send(message.toJson());
  }

  void _publish(TelephonyChannelMessage message) {
    _listeners.forEach((l) => l.onTelephonyChannelMessage(message));
  }
}

abstract class TelephonyChannelListener {
  void onTelephonyChannelMessage(TelephonyChannelMessage message);
}
