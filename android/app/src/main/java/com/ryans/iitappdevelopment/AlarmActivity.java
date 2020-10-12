package com.ryans.iitappdevelopment;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class AlarmActivity extends AppCompatActivity {

  private static final String TAG = "TAG";
  Button startButton;
  Button stopButton;

  JobScheduler jobScheduler;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_alarm);

    jobScheduler = (JobScheduler) getSystemService(JOB_SCHEDULER_SERVICE);

    startButton = findViewById(R.id.start_job);
    stopButton = findViewById(R.id.stop_job);

    startButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        startJob();
      }
    });

    stopButton.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        stopJob();
      }
    });
  }

  public void startJob(){
    ComponentName componentName = new ComponentName(this, MyIntentService.class);

    JobInfo jobInfo = new JobInfo.Builder(101, componentName)
            .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
            .setPeriodic(15*60*1000)
            .setRequiresCharging(false)
            .setPersisted(true)
            .build();

    if (jobScheduler.schedule(jobInfo) == JobScheduler.RESULT_SUCCESS){
      Log.i(TAG, ": Job started");
    }
    else {
      Log.i(TAG, ": Job could not be started");
    }
  }

  private void stopJob(){

    // Cancelling all alarms
    AlarmManager alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);
    Intent intent = new Intent(this, AlarmReceiver.class);

    PendingIntent pendingIntent1 = PendingIntent.getBroadcast(this, 1, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent2 = PendingIntent.getBroadcast(this, 2, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent3 = PendingIntent.getBroadcast(this, 3, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent4 = PendingIntent.getBroadcast(this, 4, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent5 = PendingIntent.getBroadcast(this, 5, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent6 = PendingIntent.getBroadcast(this, 6, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent7 = PendingIntent.getBroadcast(this, 7, intent, PendingIntent.FLAG_UPDATE_CURRENT);

    assert alarmManager != null;
    alarmManager.cancel(pendingIntent1);
    alarmManager.cancel(pendingIntent2);
    alarmManager.cancel(pendingIntent3);
    alarmManager.cancel(pendingIntent4);
    alarmManager.cancel(pendingIntent5);
    alarmManager.cancel(pendingIntent6);
    alarmManager.cancel(pendingIntent7);

    // stop job
    jobScheduler.cancel(101);
    Log.i(TAG, ": Job stopped");
  }
}
