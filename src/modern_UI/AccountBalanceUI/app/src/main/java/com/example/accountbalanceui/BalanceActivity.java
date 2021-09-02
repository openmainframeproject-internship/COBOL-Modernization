package com.example.accountbalanceui;

import android.os.Bundle;
import android.util.Log;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import okhttp3.MediaType;
import okhttp3.RequestBody;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class BalanceActivity extends AppCompatActivity {
    private static final String TAG = BalanceActivity.class.getSimpleName();
    TextView heading, userid, uname;
    LinearLayout layout;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_balance);
        heading = findViewById(R.id.heading);
        layout = findViewById(R.id.balance);
        userid = findViewById(R.id.uid);
        uname = findViewById(R.id.uname);
        String uid = getIntent().getStringExtra("uid");
        String username = getIntent().getStringExtra("uname");
        userid.setText("User ID: " + uid);
        uname.setText("Username: " + username);
        try {
            JSONObject customer_id = new JSONObject();
            customer_id.put("CUST_ID", uid);
            JSONObject request = new JSONObject();
            request.put("balnce", customer_id);
            RequestBody body = RequestBody.create(MediaType.parse("application/json; charset=utf-8"), (request.toString()));
            URL base_URL = new URL("http://ec2-3-65-59-191.eu-central-1.compute.amazonaws.com:5483");
            ApiInterface apiInterface = ApiClient.getClient(base_URL).create(ApiInterface.class);
            Call<ResponseBody> balanceRequest = apiInterface.getBalance(body);
            balanceRequest.enqueue(new Callback<ResponseBody>() {
                @Override
                public void onResponse(@NonNull Call<ResponseBody> call, @NonNull Response<ResponseBody> response) {
                    try {
                        if (response.isSuccessful()) {
                            Log.d(TAG, response.code() + ": " + response.message());
                            assert response.body() != null;
                            String res = response.body().string();
                            JSONObject json_response = new JSONObject(res);
                            JSONObject resp = json_response.getJSONObject("balnceResponse")
                                    .getJSONObject("BALANCE_OUT").getJSONObject("OUT03_DATA")
                                    .getJSONObject("OUT03O_DATA_R");
                            Log.d(TAG, resp.toString());
                            JSONArray array = resp.getJSONArray("OUT03O_ACC_INFO");
                            heading.setText("Account Information");
                            for (int i = 0; i < array.length(); i++) {
                                JSONObject object = array.getJSONObject(i);
                                if (!object.getString("OUT03O_ACC_NO").equals("")) {
                                    String acc_no = object.getString("OUT03O_ACC_NO");
                                    String desc = object.getString("OUT03O_ACC_DESC");
                                    String bal = object.getString("OUT03O_ACC_BAL");
                                    bal = bal.substring(0, bal.length() - 1);
                                    double balance = Double.parseDouble(bal);
                                    balance = balance / 10;
                                    String date = object.getString("OUT03O_DTE");
                                    String tranxn;
                                    if (object.getString("OUT03O_TXN").equals("*")) {
                                        tranxn = "Yes";
                                    } else {
                                        tranxn = "No";
                                    }
                                    String text = "Account No.: " + acc_no
                                            + "\nAccount type: " + desc
                                            + "\nCurrent Balance: " + balance
                                            + "\nLast Statement: " + date
                                            + "\nTransactions Available: " + tranxn;
                                    TextView data = new TextView(BalanceActivity.this);
                                    data.setText(text);
                                    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                                            LinearLayout.LayoutParams.MATCH_PARENT,
                                            LinearLayout.LayoutParams.WRAP_CONTENT
                                    );
                                    params.setMargins(50, 10, 50, 10);
                                    data.setLayoutParams(params);
                                    layout.addView(data);
                                }
                            }
                        } else {
                            heading.setText(response.code() + ": " + response.message());
                        }
                    } catch (IOException | JSONException e) {
                        e.printStackTrace();
                        heading.setText(e.getMessage());
                    }
                }

                @Override
                public void onFailure(@NonNull Call<ResponseBody> call, @NonNull Throwable t) {
                    heading.setText(t.getMessage());
                    t.printStackTrace();
                }
            });
        } catch (JSONException | MalformedURLException e) {
            heading.setText(e.getMessage());
            e.printStackTrace();
        }
    }
}
