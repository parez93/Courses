package com.federicoparezzan.chapters.one;

public class GroupingAndBackReference {

    public static final String EXAMPLE_TEST = "This is my small example string , (watch the space and comma and dot) which . I'm going to use for pattern matching.";
    public static final String EXAMPLE_TEST_HTML = "<html><head><title color=\"blue\">Watch no tag title opened</title></head></html>";

    private static GroupingAndBackReference instance = new GroupingAndBackReference();

    public static void main(String[] args) {

        instance.testGrouping();
        instance.testBackReference();
        instance.negativeLookAhead();
    }

    private void testGrouping(){
        // Removes whitespace between a word character and . or ,
        String pattern = "(\\w)(\\s+)([\\.,])";
        System.out.println(EXAMPLE_TEST.replaceAll(pattern, "$1$3"));
    }

    private void testBackReference(){
        // Extract the text between the two title elements
        String pattern = "(?i)(<title.*?>)(.+?)()";
        String updated = EXAMPLE_TEST_HTML.replaceAll(pattern, "$2");
        System.out.println(updated);
    }

    private void negativeLookAhead(){
        // Negative look ahead are defined via (?!pattern).
        // For example, the following will match "a" if "a" is not followed by "b".
        String pattern = "a(?!b)";
        String updated = EXAMPLE_TEST.replaceAll(pattern, "_");
        System.out.println(updated);
    }

}
