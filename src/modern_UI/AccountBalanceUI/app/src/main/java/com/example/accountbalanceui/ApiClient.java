package com.example.accountbalanceui;

import java.net.URL;

import retrofit2.Retrofit;
import retrofit2.adapter.rxjava3.RxJava3CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

public class ApiClient {

    public static Retrofit getClient(URL base_URL) {
        //public static final String BASE_URL = "http://lab.gdy.club:8011/";
        return new Retrofit.Builder()
                .baseUrl(base_URL)
                .addCallAdapterFactory(RxJava3CallAdapterFactory.create())
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
}
