package in.wptrafficanalyzer.locationfromgps;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends Activity {
	
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        Button btn_ok = (Button) findViewById(R.id.ok);
        
        // Listening to News Feed button click
        btn_ok.setOnClickListener(new View.OnClickListener() {
			
			public void onClick(View view) {
				// Launching News Feed Screen
				Intent i = new Intent(getApplicationContext(), GPSActivity.class);
				startActivity(i);
			}
		});
       
       	
    }
	
}