package com.hpe.ao.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTimeConstants;
import org.joda.time.LocalDate;

public class AppUtil {
	public static final SimpleDateFormat DATE_FORMAT_ddMMMyyyy_DASH = new SimpleDateFormat("dd-MMM-yyyy");
	public static final SimpleDateFormat DATE_FORMAT_yyyymmdd_DASH = new SimpleDateFormat("yyyy-mm-dd");

	public static Date getDate(SimpleDateFormat format, String source) {
		try {
			return format.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public static Date getDate_ddMMMyyyyDash(String date_ddMMMyyyyDash) {
		return getDate(DATE_FORMAT_ddMMMyyyy_DASH, date_ddMMMyyyyDash);
	}

	public static Date getDate_yyyymmddDash(String date_yyyymmddDash) {
		return getDate(DATE_FORMAT_yyyymmdd_DASH, date_yyyymmddDash);
	}

	public static LocalDate getLocalDate(Date date) {
		return LocalDate.fromDateFields(date);
	}

	public static Date getDate(Date date, int addDays) {
		return getLocalDate(date).plusDays(addDays).toDateTimeAtStartOfDay().toDate();
	}

	public static Date getDate(LocalDate localDate) {
		return localDate.toDateTimeAtStartOfDay().toDate();
	}

	public static Date getFirstMonday(int year, int month) {
		LocalDate localDate = new LocalDate(year, month, 1);
		return getNextMonday(localDate);
	}

	public static Date getNextMonday(Date date) {
		LocalDate localDate = getLocalDate(date);
		return getNextMonday(localDate);
	}

	public static Date getNextMonday(LocalDate localDate) {
		while (localDate.getDayOfWeek() != DateTimeConstants.MONDAY) {
			localDate = localDate.plusDays(1);
		}

		return getDate(localDate);
	}

	/**
	 * 
	 * @param date1
	 * @param date2
	 * @return date1 - date2
	 */
	public static Long getDateDiffDays(Date date1, Date date2) {
		if (date1 == null || date2 == null) {
			return null;
		}

		long diff = date1.getTime() - date2.getTime();
		long diffHours = diff / (60 * 60 * 1000);
		long diffDays = diffHours / 24;
		return new Long(diffDays); // new Long(diffHours).toString();
	}

}
