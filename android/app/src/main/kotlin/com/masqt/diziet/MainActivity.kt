package com.masqt.diziet

import android.os.Bundle
import com.masqt.diziet.Constants.CHANNEL_NAME_TELEPHONY

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.JSONMessageCodec
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private lateinit var messageChannel: BasicMessageChannel<Any>
  private lateinit var clientMessageListener: ClientMessageListener

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    // Set up our platform channel back to Flutter
    messageChannel = BasicMessageChannel(
            flutterView,
            CHANNEL_NAME_TELEPHONY,
            JSONMessageCodec.INSTANCE
    ).also {
        // Set the message handler
        it.setMessageHandler {msg, _ -> clientMessageListener.onClientMessage(msg)}
    }
  }
}
