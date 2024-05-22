package com.article.model;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImageExtractor {
    public static List<String> extractImageSrc(String content) {
        List<String> result = new ArrayList<>();
        String imgPattern = "<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>";
        Pattern pattern = Pattern.compile(imgPattern);
        Matcher matcher = pattern.matcher(content);
        
        while (matcher.find()) {
            result.add(matcher.group(1));
        }
        
        return result;
    }
}
