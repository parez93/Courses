package com.federicoparezzan.chapters.two;

public class RegexWithStringMethods {
    /*
    Strings in Java have built-in support for regular expressions.
    Strings have four built-in methods for regular expressions, i.e.,
    the matches(), split()), replaceFirst() and replaceAll() methods.
    The replace() method does NOT support regular expressions.
    These methods are not optimized for performance.
     */

    public static final String EXAMPLE_TEST = "This is my small example string which I'm going to use for pattern matching.";
    private static RegexWithStringMethods regex = new RegexWithStringMethods();


    public static void main(String[] args) {
        regex.testWithMatches();
        regex.testWithSplit();
        regex.testWithReplaceAll();
    }

    private void testWithMatches(){
        System.out.println(EXAMPLE_TEST.matches("\\w.*"));
    }

    private void testWithSplit(){
        String[] splitString = (EXAMPLE_TEST.split("\\s+"));
        System.out.println(splitString.length); // should be 14
        for (String string : splitString) {
            System.out.println(string);
        }
    }

    private void testWithReplaceAll(){
        // replace all whitespace with tabs
        System.out.println(EXAMPLE_TEST.replaceAll("\\s+", "\t"));
    }
}
