package com.ryans.iitappdevelopment;

import android.annotation.TargetApi;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build;

import androidx.core.app.NotificationCompat;

public class NotificationHelper extends ContextWrapper {
  private static final String channelID = "alarm_manager_channel_id";
  private static final CharSequence channelName = "alarm_manager_channel_name";
  private NotificationManager myNotificationManager;

  public NotificationHelper(Context base) {
    super(base);
    if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
      createChannel();
    }
  }

  @TargetApi(Build.VERSION_CODES.O)
  private void createChannel(){
    NotificationChannel channel = new NotificationChannel(channelID, channelName, NotificationManager.IMPORTANCE_HIGH);

    getManager().createNotificationChannel(channel);
  }

  public NotificationManager getManager(){
    if(myNotificationManager == null){
      myNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
    }

    return myNotificationManager;
  }

  public NotificationCompat.Builder getChannelNotification() {
    return new NotificationCompat.Builder(getApplicationContext(), channelID)
            .setContentTitle("Alarm!")
            .setContentText("Your AlarmManager is working.")
            .setSmallIcon(R.drawable.ic_launcher);
  }
}