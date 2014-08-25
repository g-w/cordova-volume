package de.codevise.cordova.volume;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import android.content.Context;
import android.media.AudioManager;

public class Volume extends CordovaPlugin {

    private static final int STREAM = AudioManager.STREAM_MUSIC;

    private Context context;

    @Override
    public void initialize (CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        context = super.cordova.getActivity().getApplicationContext();
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("getVolume".equals(action)) {
            PluginResult result = new PluginResult(PluginResult.Status.OK, (float) currentVolume());
            callbackContext.sendPluginResult(result);
            return true;
        }
        return false;
    }

    private double currentVolume() {
        AudioManager audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        int volume = audioManager.getStreamVolume(STREAM);
        if (volume == 0) {
            return 0.0;
        }
        return 1.0 * volume / audioManager.getStreamMaxVolume(STREAM);
    }

}
