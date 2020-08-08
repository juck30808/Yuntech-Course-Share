package librarySystem;

import java.util.Calendar;  
import java.util.Date;  
import java.util.Timer; 
public class Time {

		private static final long PERIOD_DAY = 24*60*60*1000;
		
		public Time() {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.HOUR_OF_DAY,1);
			calendar.set(Calendar.MINUTE,0);
			calendar.set(Calendar.SECOND,0);
			Date date = calendar.getTime();
			if(date.before(new Date())) {
				date = this.addDay(date,1);
			}
			
			Timer timer = new Timer();
			CheckOverdueBook task = new CheckOverdueBook();
			timer.schedule(task, date, PERIOD_DAY);
		}
		
		public Date addDay(Date date, int num) {
			Calendar startDT = Calendar.getInstance();
			startDT.setTime(date);
			startDT.add(Calendar.DAY_OF_MONTH, num);
			return startDT.getTime();
		}
	}
