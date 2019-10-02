package com.masqt.diziet

import android.util.Log
import org.json.JSONObject

import com.masqt.diziet.Constants.MESSAGE_CLIENT_ACCEPT_INCOMING_CALL

class ClientMessageListener {
    fun onClientMessage(msg: Any?) {
        val obj = msg as JSONObject;
        when(obj["type"]) {
            MESSAGE_CLIENT_ACCEPT_INCOMING_CALL -> onAnswerIncomingCallInvite()
        }
    }

    private fun onAnswerIncomingCallInvite() {
        Log.i(TAG, "onAnswerIncomingCallInvite()")
        TODO("Not implemented yet")
    }

    companion object {
        const val TAG = "ClientMessageListener"
    }
}