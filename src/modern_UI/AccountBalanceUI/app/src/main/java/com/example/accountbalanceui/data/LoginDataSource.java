package com.example.accountbalanceui.data;

import android.util.Log;

import androidx.annotation.NonNull;

import com.example.accountbalanceui.ApiClient;
import com.example.accountbalanceui.ApiInterface;
import com.example.accountbalanceui.data.model.LoggedInUser;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.URL;

import okhttp3.MediaType;
import okhttp3.RequestBody;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Class that handles authentication w/ login credentials and retrieves user information.
 */
public class LoginDataSource {
    private static final String TAG = LoginDataSource.class.getSimpleName();
    String errMsg;
    String uid;
    String uname;
    private boolean isLoggedIn = false;

    public Result<LoggedInUser> login(String username, String password) {
        try {
            // TODO: handle loggedInUser authentication
            JSONObject loginDetails = new JSONObject();
            loginDetails.put("BRE_I_BANK_SIGNON_ID", username);
            loginDetails.put("BRE_I_BANK_PSWD", password);
            JSONObject inpStruct = new JSONObject();
            inpStruct.put("BRE_INP_INPUT_STRUCTURE", loginDetails);
            JSONObject request = new JSONObject();
            request.put("UV", inpStruct);
            RequestBody body = RequestBody.create(MediaType.parse("application/json; charset=utf-8"), (request.toString()));
            URL base_URL = new URL("http://ec2-3-65-59-191.eu-central-1.compute.amazonaws.com:9876");
            ApiInterface apiInterface = ApiClient.getClient(base_URL).create(ApiInterface.class);
            Call<ResponseBody> usernameResponse = apiInterface.getUsername(body);
            usernameResponse.enqueue(new Callback<ResponseBody>() {
                @Override
                public void onResponse(@NonNull Call<ResponseBody> call, @NonNull Response<ResponseBody> response) {
                    try {
                        if (response.isSuccessful()) {
                            Log.d(TAG, response.code() + ": " + response.message());
                            assert response.body() != null;
                            String res = response.body().string();
                            JSONObject json_response = new JSONObject(res);
                            JSONObject resp = json_response.getJSONObject("UVResponse");
                            JSONObject outputStruct = resp.getJSONObject("BRE_OUT_OUTPUT_STRUCTURE");
                            int inpFlag = outputStruct.getInt("BRE_O_WS_INPUT_FLAG");
                            if (inpFlag == 0) {
                                isLoggedIn = true;
                                uid = outputStruct.getString("BRE_O_BANK_USERID");
                                uname = outputStruct.getString("BRE_O_BANK_USERID_NA");
                            } else if (inpFlag == 1) {
                                isLoggedIn = false;
                                errMsg = outputStruct.getString("BRE_O_WS_ERROR_MSG");
                            }
                        } else {
                            isLoggedIn = false;
                            errMsg = response.code() + ": " + response.message();
                        }
                    } catch (IOException | JSONException e) {
                        isLoggedIn = false;
                        e.printStackTrace();
                        errMsg = e.getMessage();
                    }
                }

                @Override
                public void onFailure(@NonNull Call<ResponseBody> call, @NonNull Throwable t) {
                    isLoggedIn = false;
                    errMsg = t.getMessage();
                    t.printStackTrace();
                }
            });
            if (isLoggedIn) {
                LoggedInUser user =
                        new LoggedInUser(
                                uid,
                                uname);
                return new Result.Success<>(user);
            } else {
                Log.e(TAG, errMsg);
                return new Result.Error(new IOException(errMsg));
            }
        } catch (Exception e) {
            return new Result.Error(new IOException("Error logging in", e));
        }
    }

    public void logout() {
        // TODO: revoke authentication
    }
}