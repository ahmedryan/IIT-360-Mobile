package com.ryans.iitappdevelopment;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Intent;
import android.util.Log;

import java.util.concurrent.ExecutionException;

public class MyIntentService extends JobService {

  private static final String TAG = "TAG";
  JobParameters params;

  @Override
  public boolean onStartJob(JobParameters params) {
    this.params = params;
    Log.i(TAG, ": Scheduler Started");
    doBackgroundWork();
    return true;
  }

  private void doBackgroundWork(){
    new Thread(new Runnable() {
      @Override
      public void run() {
        setAlarm();
      }
    }).start();
  }

  public void setAlarm(){

    // Declaration
    Intent intent = new Intent(this, AlarmReceiver.class);
    AlarmManager alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);
    long sundayAlarmTime=0, mondayAlarmTime=0, tuesdayAlarmTime=0, wednesdayAlarmTime=0,
            thursdayAlarmTime=0, fridayAlarmTime=0, saturdayAlarmTime=0;


    // Fetching Data and halting the thread until fetching data is completed
    FetchData fetchData = new FetchData();

    try {
      fetchData.execute().get();
    } catch (ExecutionException | InterruptedException e) {
      e.printStackTrace();
    }

    System.out.println("Alarm Setting Started");


    // Setting Alarm Times
    if(fetchData.getSundayCalendar() != null)
      sundayAlarmTime = fetchData.getSundayCalendar().getTimeInMillis();
    if(fetchData.getMondayCalendar() != null)
      mondayAlarmTime = fetchData.getMondayCalendar().getTimeInMillis();
    if(fetchData.getTuesdayCalendar() != null)
      tuesdayAlarmTime = fetchData.getTuesdayCalendar().getTimeInMillis();
    if(fetchData.getWednesdayCalendar() != null)
      wednesdayAlarmTime = fetchData.getWednesdayCalendar().getTimeInMillis();
    if(fetchData.getThursdayCalendar() != null)
      thursdayAlarmTime = fetchData.getThursdayCalendar().getTimeInMillis();
    if(fetchData.getFridayCalendar() != null)
      fridayAlarmTime = fetchData.getFridayCalendar().getTimeInMillis();
    if(fetchData.getSaturdayCalendar() != null)
      saturdayAlarmTime = fetchData.getSaturdayCalendar().getTimeInMillis();


    // Declaring Pending Intents
    PendingIntent pendingIntent1 = PendingIntent.getBroadcast(
            this, 1, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent2 = PendingIntent.getBroadcast(
            this, 2, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent3 = PendingIntent.getBroadcast(
            this, 3, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent4 = PendingIntent.getBroadcast(
            this, 4, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent5 = PendingIntent.getBroadcast(
            this, 5, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent6 = PendingIntent.getBroadcast(
            this, 6, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    PendingIntent pendingIntent7 = PendingIntent.getBroadcast(
            this, 7, intent, PendingIntent.FLAG_UPDATE_CURRENT);


    // Setting Alarms
    assert alarmManager != null;
    if(sundayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, sundayAlarmTime, pendingIntent1);
    if(mondayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, mondayAlarmTime, pendingIntent2);
    if(tuesdayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, tuesdayAlarmTime, pendingIntent3);
    if(wednesdayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, wednesdayAlarmTime, pendingIntent4);
    if(thursdayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, thursdayAlarmTime, pendingIntent5);
    if(fridayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, fridayAlarmTime, pendingIntent6);
    if(saturdayAlarmTime!=0) alarmManager.setExact(
            AlarmManager.RTC_WAKEUP, saturdayAlarmTime, pendingIntent7);


    //print
    if(saturdayAlarmTime!=0) System.out.println(fetchData.getSaturdayCalendar().getTime());
    if(sundayAlarmTime!=0) System.out.println(fetchData.getSundayCalendar().getTime());
    if(mondayAlarmTime!=0) System.out.println(fetchData.getMondayCalendar().getTime());
    if(tuesdayAlarmTime!=0) System.out.println(fetchData.getTuesdayCalendar().getTime());
    if(wednesdayAlarmTime!=0) System.out.println(fetchData.getWednesdayCalendar().getTime());
    if(thursdayAlarmTime!=0) System.out.println(fetchData.getThursdayCalendar().getTime());
    if(fridayAlarmTime!=0) System.out.println(fetchData.getFridayCalendar().getTime());

    this.jobFinished(params, false);
  }

  @Override
  public boolean onStopJob(JobParameters params) {
    return true;
  }

  @Override
  public void onDestroy() {
    Log.i(TAG, ": Scheduler Stopped");

    super.onDestroy();
  }
}
