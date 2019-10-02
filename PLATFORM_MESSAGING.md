# Platform-specific messaging specification

We use [JSON](https://json.org) messages to communicate between
the cross-platform Flutter code and
the platform-specific Android/iOS code
that targets lower-level device APIs (e.g. voice calls, SMS, notifications, etc.).
The message exchange mechanism is called a "platform channel" in the
[Flutter documentation](https://flutter.dev/docs/development/platform-integration/platform-channels).
It's similar to the way that REST clients and servers
communicate by exchanging JSON.

In order to make independent platform-specific development as
straightforward as possible,
we have defined our own messaging specification.

## Terminology

**Host**
: The platform that Diziet's Flutter code is running on.

**Client**
: The Flutter code.


## Message format

Every message is an object containing a 
`type` property and a `payload` property.
Types are strings, and payloads are
arbitrary valid JSON (usually JSON objects). For example:
```
{
    "type": "MESSAGE_HOST_INCOMING_CALL_INVITE",
    "payload": {
        "from": "+353861231234",
        "to": "+35315559999"
    }
}
```

The `type` property tells us that this is a message
from the host informing us of an incoming call invite.
The `payload` property tells us the caller's number
(`from`) and the recipient number they are calling (`to`).
The Flutter front-end can use this to display the
incoming call screen.

Here is another example: this is the message that
the client sends to the host if the user has indicated
that they want to take the incoming call from above.
```
{
    "type": "MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE",
    "payload": {}
}
```
The platform-specific code on the host will understand
this to mean that it should accept the incoming call.
In this case, it's OK for the payload to be empty,
because there can only be one incoming call invite
at any given time. (This is a built-in limitation
of Twilio's client SDKs.)

## Conventions

Because the messages are simply JSON, it's important
to stay consistent. Specifically, the `type`
property string should follow the following convention:
* Message types are all upper-case, with words separated
    by underscores.
* All message types begin with `MESSAGE`.
* Messages sent from the host to the client begin with `MESSAGE_HOST`;
    messages sent from the client to the host begin with `MESSAGE_CLIENT`.
* The rest of the message type should be a concise but
    informative description of what the message contains
    or what the recipient should do when it receives the message.
