package com.example.accountbalanceui;

import okhttp3.RequestBody;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Headers;
import retrofit2.http.POST;

public interface ApiInterface {

    @Headers("Content-Type: application/json")
    @POST("cics/signon")
    Call<ResponseBody> getUsername(@Body RequestBody postparams);

    @Headers("Content-Type: application/json")
    @POST("cics/balnce")
    Call<ResponseBody> getBalance(@Body RequestBody postparams);
}
