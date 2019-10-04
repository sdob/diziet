import 'package:diziet/platform_channels/client_messages.dart' show SendSMS;
import 'package:diziet/platform_channels/telephony_channel.dart';
import 'package:flutter/material.dart';

Future<void> sendMessage(OutboundSMS message) async {
  throw UnimplementedError();
}

class OutboundSMS {
  final String from;
  final String body;
  final String to;

  OutboundSMS({@required this.from, @required this.to, @required this.body});

  Map<String, String> toJSON() => {
        'from': from,
        'to': to,
        'body': body,
      };
}
