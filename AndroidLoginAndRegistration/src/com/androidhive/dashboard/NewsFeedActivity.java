package com.androidhive.dashboard;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import com.androidhive.loginandregister.R;
import com.androidhive.loginandregister.R.id;
import com.androidhive.loginandregister.R.layout;

public class NewsFeedActivity extends Activity {
	 /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
       super.onCreate(savedInstanceState);
        setContentView(R.layout.news_feed_layout);
    }
}
