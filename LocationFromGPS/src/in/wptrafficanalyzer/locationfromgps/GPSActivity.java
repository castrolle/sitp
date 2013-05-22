package in.wptrafficanalyzer.locationfromgps;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.Menu;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

@SuppressLint("NewApi")
public class GPSActivity extends Activity implements LocationListener{
	
	LocationManager locationManager ;
	String provider;
	HttpClient httpClient ;
	HttpGet del;
	private String busId;
	
	{
		StrictMode.ThreadPolicy policy=new StrictMode.ThreadPolicy.Builder().permitAll().build();
		StrictMode.setThreadPolicy(policy);
		}


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
       	httpClient= new DefaultHttpClient();
        
        setContentView(R.layout.activity_gps);
        
        // Getting LocationManager object
        locationManager = (LocationManager)getSystemService(Context.LOCATION_SERVICE);        
        
        // Creating an empty criteria object
        Criteria criteria = new Criteria();
        
        // Getting the name of the provider that meets the criteria
        provider = locationManager.getBestProvider(criteria, false);
        
                
        if(provider!=null && !provider.equals("")){
        	
        	// Get the location from the given provider 
            Location location = locationManager.getLastKnownLocation(provider);
                        
            locationManager.requestLocationUpdates(provider, 20000, 1, this);
            
            
            if(location!=null){
            	onLocationChanged(location);
            }
            else
            	Toast.makeText(getBaseContext(), "Location can't be retrieved", Toast.LENGTH_SHORT).show();
            
        }else{
        	Toast.makeText(getBaseContext(), "No Provider Found", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
    
	@Override
	public void onLocationChanged(Location location) {
		// Getting reference to TextView tv_longitude
		TextView tvLongitude = (TextView)findViewById(R.id.tv_longitude);
		
		EditText txtIdBus = (EditText)findViewById(R.id.txtBus);
    	busId = txtIdBus.getText().toString();
		
		// Getting reference to TextView tv_latitude
		TextView tvLatitude = (TextView)findViewById(R.id.tv_latitude);
		
		// Setting Current Longitude
		tvLongitude.setText("Longitude:" + location.getLongitude());
		
		// Setting Current Latitude
		tvLatitude.setText("Latitude:" + location.getLatitude() );
		
		try {
			
			if(busId == null || busId.isEmpty()){
				busId = "0";
			}
			
			del = new HttpGet("http://busgps.hostoi.com/add_position.php?bus="+busId+"&longitude="+location.getLongitude()+"&latitude="+location.getLatitude());
			del.setHeader("content-type", "application/json");
			httpClient.execute(del);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}

	@Override
	public void onProviderDisabled(String provider) {
		// TODO Auto-generated method stub		
	}

	@Override
	public void onProviderEnabled(String provider) {
		// TODO Auto-generated method stub		
	}

	@Override
	public void onStatusChanged(String provider, int status, Bundle extras) {
		// TODO Auto-generated method stub		
	}
}