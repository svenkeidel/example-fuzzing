package org.example;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Webserver {
    public static void checkUrl(String url) {
        Pattern pattern = Pattern.compile("^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(url);
        if(matcher.find()) {
            throw new RuntimeException("Matched");
        }
    }
}