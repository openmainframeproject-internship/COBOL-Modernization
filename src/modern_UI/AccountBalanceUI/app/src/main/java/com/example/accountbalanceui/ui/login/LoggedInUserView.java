package com.example.accountbalanceui.ui.login;

/**
 * Class exposing authenticated user details to the UI.
 */
class LoggedInUserView {
    private final String displayName;
    private final String uid;
    //... other data fields that may be accessible to the UI

    LoggedInUserView(String uid, String displayName) {
        this.uid = uid;
        this.displayName = displayName;
    }

    String getDisplayName() {
        return displayName;
    }

    String getUid() {
        return uid;
    }
}