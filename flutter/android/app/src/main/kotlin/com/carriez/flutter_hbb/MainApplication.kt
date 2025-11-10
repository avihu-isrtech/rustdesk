package com.carriez.flutter_hbb

import android.app.Application
import android.util.Log
import android.provider.Settings
import ffi.FFI

class MainApplication : Application() {
    companion object {
        private const val TAG = "MainApplication"
    }

    override fun onCreate() {
        super.onCreate()
        Log.d(TAG, "App start")
        FFI.onAppStart(applicationContext)
        val androidId = Settings.Secure.getString(applicationContext.contentResolver, Settings.Secure.ANDROID_ID)
        if (androidId != null) {
            FFI.setAndroidId(androidId)
        }
    }
}
