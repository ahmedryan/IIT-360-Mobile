package com.ryans.iitappdevelopment;

import android.os.AsyncTask;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;

public class FetchData extends AsyncTask<Void, Void, Void> {
  private static final String TAG = "TAG";
  private String data = "";

  private Calendar sundayCalendar;
  private Calendar mondayCalendar;
  private Calendar tuesdayCalendar;
  private Calendar wednesdayCalendar;
  private Calendar thursdayCalendar;
  private Calendar fridayCalendar;
  private Calendar saturdayCalendar;

  @Override
  protected Void doInBackground(Void... voids) {
    try {
      FirebaseUser currentFirebaseUser = FirebaseAuth.getInstance().getCurrentUser();

      String email = currentFirebaseUser.getEmail();

      URL url = new URL("https://iit360api20200630172203.azurewebsites.net" +
              "/api/Routines/EarliestClass/" + email);
      System.out.println("URL = " + url);
      HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

      InputStream inputStream = httpURLConnection.getInputStream();
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

      String line = bufferedReader.readLine();
      while (line != null){
        data += line;
        line = bufferedReader.readLine();
      }

      JSONArray jA = new JSONArray(data);

      for (int i=0; i<jA.length(); i++){
        JSONObject jO = (JSONObject) jA.get(i);

        String[] splitDate = ((String) jO.get("date")).split("-", 3);
        String[] splitDay = ((String) jO.get("beginTime")).split(":", 3);

        int year = Integer.parseInt(splitDate[0]);
        int month  = Integer.parseInt(splitDate[1])-1;
        int date  = Integer.parseInt(splitDate[2]);
        int hour  = Integer.parseInt(splitDay[0]);
        int minute  = Integer.parseInt(splitDay[1]);

        String fetchedDay = (String) jO.get("dayname");

        Calendar temp = Calendar.getInstance();
        temp.set(year, month, date, hour, minute);

        if (fetchedDay.equals("Sun")) sundayCalendar = temp;
        else if (fetchedDay.equals("Mon")) mondayCalendar = temp;
        else if (fetchedDay.equals("Tue")) tuesdayCalendar = temp;
        else if (fetchedDay.equals("Wed")) wednesdayCalendar = temp;
        else if (fetchedDay.equals("Thu")) thursdayCalendar = temp;
        else if (fetchedDay.equals("Fri")) fridayCalendar = temp;
        else if (fetchedDay.equals("Sat")) saturdayCalendar = temp;

      }

//      System.out.println(sundayCalendar);
//      System.out.println(mondayCalendar);
//      System.out.println(tuesdayCalendar);
//      System.out.println(wednesdayCalendar);
//      System.out.println(thursdayCalendar);
//      System.out.println(fridayCalendar);
//      System.out.println(saturdayCalendar);

    } catch (IOException | JSONException e) {
      e.printStackTrace();
    }

    return null;
  }

  @Override
  protected void onPostExecute(Void aVoid) {
    super.onPostExecute(aVoid);
    System.out.println("Fetch Data Completed");
  }

  public Calendar getSundayCalendar() {
    return sundayCalendar;
  }
  public Calendar getMondayCalendar() {
    return mondayCalendar;
  }
  public Calendar getTuesdayCalendar() {
    return tuesdayCalendar;
  }
  public Calendar getWednesdayCalendar() {
    return wednesdayCalendar;
  }
  public Calendar getThursdayCalendar() {
    return thursdayCalendar;
  }
  public Calendar getFridayCalendar() {
    return fridayCalendar;
  }
  public Calendar getSaturdayCalendar() {
    return saturdayCalendar;
  }
}