

java.time 是 Java 8 引入的全新日期和时间处理 API，它旨在解决旧的 java.util.Date 和 java.util.Calendar 存在的诸多问题，如线程不安全、设计不合理、API 复杂等。java.time 提供了丰富的类和方法，使得日期和时间的处理更加简洁、直观和安全。以下是对 java.time 中一些常用类和功能的介绍：

```
LocalDate 表示不带时区的日期，常用于处理年、月、日信息

import java.time.LocalDate;

public class LocalDateExample {
    public static void main(String[] args) {
        // 获取当前日期
        LocalDate currentDate = LocalDate.now();
        System.out.println("当前日期: " + currentDate);

        // 指定日期
        LocalDate specificDate = LocalDate.of(2024, 10, 1);
        System.out.println("指定日期: " + specificDate);

        // 获取日期的年份、月份、日
        int year = specificDate.getYear();
        int month = specificDate.getMonthValue();
        int day = specificDate.getDayOfMonth();
        System.out.println("年份: " + year + ", 月份: " + month + ", 日: " + day);
    }
}


LocalTime 表示不带时区的时间，常用于处理时、分、秒和纳秒信息

import java.time.LocalTime;

public class LocalTimeExample {
    public static void main(String[] args) {
        // 获取当前时间
        LocalTime currentTime = LocalTime.now();
        System.out.println("当前时间: " + currentTime);

        // 指定时间
        LocalTime specificTime = LocalTime.of(14, 30, 0);
        System.out.println("指定时间: " + specificTime);

        // 获取时间的小时、分钟、秒
        int hour = specificTime.getHour();
        int minute = specificTime.getMinute();
        int second = specificTime.getSecond();
        System.out.println("小时: " + hour + ", 分钟: " + minute + ", 秒: " + second);
    }
}


LocalDateTime 是 LocalDate 和 LocalTime 的组合，用于表示不带时区的日期和时间。
import java.time.LocalDateTime;

public class LocalDateTimeExample {
    public static void main(String[] args) {
        // 获取当前日期和时间
        LocalDateTime currentDateTime = LocalDateTime.now();
        System.out.println("当前日期和时间: " + currentDateTime);

        // 指定日期和时间
        LocalDateTime specificDateTime = LocalDateTime.of(2024, 10, 1, 14, 30, 0);
        System.out.println("指定日期和时间: " + specificDateTime);
    }
}


Duration 用于表示两个时间点之间的时长，通常用于处理秒和纳秒级别的时间差。
Period 用于表示两个日期之间的时长，通常用于处理年、月、日级别的时间差

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;

public class DurationPeriodExample {
    public static void main(String[] args) {
        // Duration 示例
        LocalTime startTime = LocalTime.of(9, 0);
        LocalTime endTime = LocalTime.of(11, 30);
        Duration duration = Duration.between(startTime, endTime);
        System.out.println("时间差（分钟）: " + duration.toMinutes());

        // Period 示例
        LocalDate startDate = LocalDate.of(2024, 1, 1);
        LocalDate endDate = LocalDate.of(2024, 10, 1);
        Period period = Period.between(startDate, endDate);
        System.out.println("日期差（年、月、日）: " + period.getYears() + " 年, " + period.getMonths() + " 月, " + period.getDays() + " 日");
    }
}


DateTimeFormatter 类用于日期和时间的格式化和解析操作。

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTimeFormatterExample {
    public static void main(String[] args) {
        // 格式化日期和时间
        LocalDateTime dateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = dateTime.format(formatter);
        System.out.println("格式化后的日期和时间: " + formattedDateTime);

        // 解析日期和时间
        String dateTimeStr = "2024-10-01 14:30:00";
        LocalDateTime parsedDateTime = LocalDateTime.parse(dateTimeStr, formatter);
        System.out.println("解析后的日期和时间: " + parsedDateTime);
    }
}
```