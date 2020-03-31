package test.com.federicoparezzan.chapters.four;

import org.junit.Test;

import static org.junit.Assert.*;

public class CheckNumberTest {

    /*
        The following example will check if a text contains a number with 3 digits.
     */

    @Test
    public void testSimpleTrue() {
        String regex = "[\\d]{3}";

        String num = "123";
        assertTrue(num.matches(regex));
        num = "000";
        assertTrue(num.matches(regex));
        num = "890";
        assertTrue(num.matches(regex));
        num = "aaa";
        assertFalse(num.matches(regex));
        num = "0";
        assertFalse(num.matches(regex));
        num = "12";
        assertFalse(num.matches(regex));
        num = "1234";
        assertFalse(num.matches(regex));
    }
}
