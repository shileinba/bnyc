package com.yonyou.tools;

import io.micrometer.common.util.StringUtils;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

//@Slf4j
public final class DateUtils {

    private DateUtils() {
    }

    private static final String FORMAT_YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";

    public static final String FORMAT_YYYY_MM_DD = "yyyy-MM-dd";

    public static final String FORMAT_YYMMDD = "yyyyMMdd";

    /**
     * 把日期格式化为yyyy-MM-dd HH:mm:ss字符串
     *
     * @param date
     * @return
     */
    public static String formatTime(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_YYYYMMDDHHMMSS);
        return sdf.format(date);
    }

    /**
     * 把日期格式化为pattern字符串
     *
     * @param date
     * @param pattern
     * @return
     */
    public static String formatTime(Date date, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(date);
    }

    /**
     * 把日期字符串转换为yyyy-MM-dd HH:mm:ss或者yyyy-MM-dd格式的日期
     *
     * @param date
     * @return
     */
    public static Date tDate(String date) {
        if (date == null) return null;
        SimpleDateFormat sdf = null;
        if (date.contains(" ")) {
            sdf = new SimpleDateFormat(FORMAT_YYYYMMDDHHMMSS);
        } else {
            sdf = new SimpleDateFormat(FORMAT_YYYY_MM_DD);
        }
        try {
            return sdf.parse(date);
        } catch (ParseException e) {
        }
        return null;
    }

    /**
     * 把日期字符串转换为pattern格式的日期
     *
     * @param date
     * @param pattern
     * @return
     */
    public static Date tDate(String date, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            return sdf.parse(date);
        } catch (ParseException e) {
        }
        return null;
    }

//    /**
//     * 日期加减法
//     *
//     * @param date
//     * @param day
//     * @return
//     */
//    public static Date addDate(Date date, int day) {
//        return new DateTime(date).plusDays(day).toDate();
//    }
//
//    /**
//     * 日期加减法
//     *
//     * @param day
//     * @return
//     */
//    public static Date addDate(int day) {
//        return new DateTime(new Date()).plusDays(day).toDate();
//    }

    /**
     * 获取格式为yyyy-MM-dd当天日期字符串
     *
     * @return
     */
    public static String getDate() {
        return formatTime(new Date(), FORMAT_YYYY_MM_DD);
    }

    /**
     * 获取格式为yyyy-MM-dd日期字符串
     *
     * @param date
     * @return
     */
    public static String getDate(Date date) {
        return formatTime(date, FORMAT_YYYY_MM_DD);
    }

    /**
     * 获取格式为yyyy-MM-dd HH:mm:ss当天日期字符串
     *
     * @return
     */
    public static String getTime() {
        return formatTime(new Date(), FORMAT_YYYYMMDDHHMMSS);
    }

    /**
     * 获取格式为yyyy-MM-dd HH:mm:ss日期字符串
     *
     * @param date
     * @return
     */
    public static String getTime(Date date) {
        return formatTime(date, FORMAT_YYYYMMDDHHMMSS);
    }

    /**
     * 获取年份
     *
     * @param date
     * @return
     */
    public static Integer getYear(Date date) {
        return Integer.valueOf(String.format("%tY", date));
    }

    /**
     * 获取月份
     *
     * @param date
     * @return
     */
    public static Integer getMonth(Date date) {
        return Integer.valueOf(String.format("%tm", date));
    }

    /**
     * 获取当前时间上个月的1号
     *
     * @return
     */
    public static String getLastMonthLastDay() {
        Calendar calendar = Calendar.getInstance();
        System.out.println("test当前时间:" + formatTime(calendar.getTime()));
//        calendar.add(Calendar.MONTH, -1);
//        calendar.set(Calendar.DAY_OF_MONTH, 1);

        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.add(Calendar.DATE, -1);
        String firstDay = formatTime(calendar.getTime(), FORMAT_YYYY_MM_DD);
        return firstDay;
    }

    /**
     * 验证开始时间小于结束时间
     *
     * @param startDate 09:00
     * @param endDate   18:00
     * @return
     */
    public static Boolean timeCompare(String startDate, String endDate) {
        Boolean flag = Boolean.FALSE;
        if (StringUtils.isNotEmpty(startDate) && StringUtils.isNotEmpty(endDate)) {
            String dateStr = DateUtils.formatTime(new Date(), "yyyy-MM-dd");
            Date start = DateUtils.tDate(dateStr + " " + startDate, "yyyy-MM-dd HH:mm");
            Date end = DateUtils.tDate(dateStr + " " + endDate, "yyyy-MM-dd HH:mm");
            if (start != null && end != null) {
                long startDateLong = start.getTime();
                long endDateLong = end.getTime();
                if (startDateLong < endDateLong) {
                    flag = Boolean.TRUE;
                }
            }
        }
        return flag;
    }

    /**
     * 将时间转化为当天的日期
     *
     * @param time 09:00
     * @return
     */
    public static Date convertCurrentDateTime(String time) {
        Date date = new Date();
        if (StringUtils.isNotEmpty(time)) {
            String dateStr = DateUtils.formatTime(date, "yyyy-MM-dd");
            date = DateUtils.tDate(dateStr + " " + time, "yyyy-MM-dd HH:mm");
        }
        return date;
    }


    /**
     * 获取某天天开始时间
     */
    public static Date getStartTime(String dateTime) {
        Date date = DateUtils.tDate(dateTime);
        Calendar todayStart = Calendar.getInstance();
        todayStart.setTime(date);
        todayStart.set(Calendar.HOUR, 0);
        todayStart.set(Calendar.MINUTE, 0);
        todayStart.set(Calendar.SECOND, 0);
        todayStart.set(Calendar.MILLISECOND, 0);
        return todayStart.getTime();
    }

    /**
     * 获取某天结束时间
     */
    public static Date getEndTime(String dateTime) {

        Date date = DateUtils.tDate(dateTime);
        Calendar todayStart = Calendar.getInstance();
        todayStart.setTime(date);
        todayStart.set(Calendar.HOUR, 23);
        todayStart.set(Calendar.MINUTE, 59);
        todayStart.set(Calendar.SECOND, 59);
        todayStart.set(Calendar.MILLISECOND, 999);
        return todayStart.getTime();
    }

    /**
     * 获取时间文件名
     *
     * @return
     */
    public static String dateTimeFile(String fileExtension) {
        //创建 StringBuffer 通过构造函数添加 文件累路径
        StringBuffer wavName = new StringBuffer("");
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        wavName.append(formatter.format(currentTime));
        int num = (int) (Math.random() * (10000 - 1000) + 1000);
        wavName.append(num);
        wavName.append(".");
        wavName.append(fileExtension);
        return wavName.toString();
    }

    /**
     * *@desc:  判断今天是星期几  测试输入第二年的1月 2月
     * *@param:  [date]
     * *@return:  java.lang.String
     * *@create:  zhaozhenkun
     * *@createtime:  2021/11/2
     * *@version: version 0.1
     */
    public static Integer getWeekDay(String time) {
        //必须yyyy-MM-dd
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Instant instant = date.toInstant();
        ZoneId zoneId = ZoneId.systemDefault();
        LocalDate localDate = instant.atZone(zoneId).toLocalDate();
        return localDate.getDayOfWeek().getValue();
    }

    /**
     * 获取明天的日期字符串
     *
     * @return
     */
    public static String tomorrowDateStr() {
        Date date = new Date();//取时间
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        //把日期往后增加一天.整数往后推,负数往前移动(1:表示明天、-1：表示昨天，0：表示今天)
        calendar.add(Calendar.DATE, 1);

        //这个时间就是日期往后推一天的结果
        date = calendar.getTime();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String tomorrowStr = formatter.format(date);
        return tomorrowStr;
    }

    /*
     * 获取日期的前一天
     * */
    public static String getSpecifiedDayBefore(String specifiedDay) {
        Calendar c = Calendar.getInstance();
        Date date = null;
        try {
            date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        c.setTime(date);
        int day = c.get(Calendar.DATE);
        c.set(Calendar.DATE, day - 1);

        String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
        return dayBefore;
    }


    public static String addDateOne(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        //把日期往后增加一天.整数往后推,负数往前移动(1:表示明天、-1：表示昨天，0：表示今天)
        calendar.add(Calendar.DATE, 1);

        //这个时间就是日期往后推一天的结果
        date = calendar.getTime();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String tomorrowStr = formatter.format(date);
        return tomorrowStr;
    }

    public static String dateToHM(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        String str = sdf.format(date);
        return str;
    }

    /**
     * 加减对应时间后的日期
     *
     * @param date   需要加减时间的日期
     * @param amount 加减的时间(毫秒)
     * @return 加减对应时间后的日期
     */
    public static Date subtractTime(Date date, int amount) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String strTime = sdf.format(date.getTime() + amount);
            Date time = sdf.parse(strTime);
            return time;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getSevenDaysAgo() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar c = Calendar.getInstance();

        c.add(Calendar.DATE, -7);

        Date monday = c.getTime();

        String preMonday = sdf.format(monday);

        String startTime = preMonday.substring(0, 10) + " 00:00:00";

        return startTime;
    }

    public static String getNowEndTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        Date day = calendar.getTime();
        String preMonday = sdf.format(day);
        return preMonday;
    }

    public static int dateComPareTo(String startDate, String endDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int result = 0;
        try {
            Date date1 = sdf.parse(startDate);
            Date date2 = sdf.parse(endDate);
            if (date1.compareTo(date2) > 0) {
                result = 1;
            } else if (date1.compareTo(date2) < 0) {
                result = -1;
            } else if (date1.compareTo(date2) == 0) {
                result = 0;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String getFourTeenDaysAgo() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar c = Calendar.getInstance();

        c.add(Calendar.DATE, -14);

        Date monday = c.getTime();

        String preMonday = sdf.format(monday);

        String startTime = preMonday.substring(0, 10) + " 00:00:00";

        return startTime;
    }

    /**
     * 判断选择的日期本月的第几天
     */
    public static int getWeeksByChooseDay() {
        LocalDate now = LocalDate.now();
        int dayOfMonth = now.getDayOfMonth();
        return dayOfMonth;
    }

    public static Date getDaysNowSpliceTime(String time, Long minutes) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar c = Calendar.getInstance();

        Date monday = c.getTime();

        String preMonday = sdf.format(monday);

        String startTime = preMonday.substring(0, 10) + " " + time + ":00";

        Date date = tDate(startTime);

        Instant instant = date.toInstant();

        ZoneId zoneId = ZoneId.systemDefault();

        java.time.LocalDateTime localDateTime = instant.atZone(zoneId).toLocalDateTime().minusMinutes(minutes);

        ZonedDateTime zdt = localDateTime.atZone(zoneId);


        return Date.from(zdt.toInstant());
    }

    public static String subtractTimeToString(LocalDateTime dateTime, int num) {
        LocalDateTime localDateTime = dateTime.minusHours(num);
        return localDateTime.toString();
    }

    public static Boolean isAmOrPm(Date estimatedTimeStart) {
        try {
            if (estimatedTimeStart != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                Date currentTime = sdf.parse("12:00");
                String timeStart = DateUtils.dateToHM(estimatedTimeStart);
                Date start = sdf.parse(timeStart);
                return currentTime.after(start) ? true : false;
            } else {
                return true;
            }
        } catch (ParseException e) {
            return true;
        }
    }

    public static String getAmountDaysAgo(int amount) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar c = Calendar.getInstance();

        c.add(Calendar.DATE, amount);

        Date monday = c.getTime();

        String preMonday = sdf.format(monday);

        String startTime = preMonday.substring(0, 10);

        return startTime;
    }

    public static String getFirstDayOfLastMonthDay() {
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfThisMonth = today.withDayOfMonth(1);
        LocalDate firstDayOfLastMonth = firstDayOfThisMonth.minusMonths(1);
        return firstDayOfLastMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public static String getLastDayOfLastMonthDay() {
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfThisMonth = today.withDayOfMonth(1);
        LocalDate lastDayOfLastMonth = firstDayOfThisMonth.minusDays(1);
        return lastDayOfLastMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public static String getFirstDayOfThisMonth() {
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfThisMonth = today.withDayOfMonth(1);
        return firstDayOfThisMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public static String getLastDayOfThisMonth() {
        LocalDate today = LocalDate.now();
        LocalDate lastDayOfThisMonth = today.withDayOfMonth(today.lengthOfMonth());
        return lastDayOfThisMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public static String getFirstDayOfPreviousMonth() {
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfThisMonth = today.withDayOfMonth(1);
        LocalDate firstDayOfPreviousMonth = firstDayOfThisMonth.minusMonths(1);
        LocalDateTime firstDayOfPreviousMonthWithTime = firstDayOfPreviousMonth.atStartOfDay();
        return firstDayOfPreviousMonthWithTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static String getLastDayOfPreviousMonth() {
        LocalDate today = LocalDate.now();
        LocalDate firstDayOfThisMonth = today.withDayOfMonth(1);
        LocalDate lastDayOfPreviousMonth = firstDayOfThisMonth.minusDays(1);
        LocalDateTime lastSecondOfLastDayOfPreviousMonth = lastDayOfPreviousMonth.atTime(23, 59, 59);
        return lastSecondOfLastDayOfPreviousMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static String getTodayStartTime() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime todayStart = now.withHour(0).withMinute(0).withSecond(0).withNano(0);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return todayStart.format(formatter);
    }
    //以获得所需格式的下个月的第一天
    public static String getNextMonthFirstDay() {
        LocalDate nextMonth = LocalDate.now().plusMonths(1);
        LocalDate firstDay = LocalDate.of(nextMonth.getYear(), nextMonth.getMonth(), 1);
        LocalDateTime firstDayDateTime = LocalDateTime.of(firstDay, LocalTime.MIN);
        return firstDayDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static void main(String[] args) {
        System.out.println(getTodayStartTime());
    }

}

