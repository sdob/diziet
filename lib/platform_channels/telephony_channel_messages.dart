import 'package:diziet/platform_channels/constants.dart';

abstract class TelephonyChannelMessage {
  Map<String, dynamic> toJson() => {'type': type, 'payload': payload};

  Map<String, dynamic> get payload;

  String get type;

  static TelephonyChannelMessage fromJson(dynamic msg) {
    // Cast to a map
    final map = msg as Map<String, dynamic>;
    final String type = map['type'];
    final Map<String, dynamic> payload = map['payload'];

    switch (type) {
      case MESSAGE_TYPE_INBOUND_SMS:
        return IncomingSmsMessage(payload);
      case MESSAGE_TYPE_INCOMING_CALL_INVITE:
        return IncomingCallInvite(payload);
      default:
        return null;
    }
  }
}

class ConnectionFailure extends TelephonyChannelMessage {
  final int _errorCode;
  final String _message;

  ConnectionFailure(Map<String, dynamic> payload)
      : _errorCode = payload['errorCode'],
        _message = payload['message'];

  get type => MESSAGE_TYPE_CONNECTION_FAILURE;

  get payload => {'errorCode': _errorCode, 'message': _message};
}

class IncomingSmsMessage extends TelephonyChannelMessage {
  final String _from;
  final String _to;
  final String _body;
  final String _direction;
  final int _timestamp;

  IncomingSmsMessage(Map<String, dynamic> payload)
      : _from = payload['from'],
        _to = payload['to'],
        _body = payload['body'],
        _direction = payload['direction'],
        _timestamp = payload['timestamp'];

  String get type => MESSAGE_TYPE_INBOUND_SMS;

  Map<String, dynamic> get payload => <String, dynamic>{
        'from': _from,
        'to': _to,
        'body': _body,
        'direction': _direction,
        'timestamp': _timestamp,
      };
}

class IncomingCallInvite extends TelephonyChannelMessage {
  final String _callerNumber;
  final String _recipientNumber;

  IncomingCallInvite(Map<String, dynamic> payload)
      : _callerNumber = payload['callerNumber'],
        _recipientNumber = payload['recipientNumber'];

  get type => MESSAGE_TYPE_INCOMING_CALL_INVITE;

  get payload => {
        'from': _callerNumber,
        'to': _recipientNumber,
      };
}

class IncomingCallInviteCancelled extends TelephonyChannelMessage {
  get type => MESSAGE_TYPE_INCOMING_CALL_INVITE_CANCELLED;

  get payload => {};
}
