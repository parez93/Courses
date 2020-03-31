package test.com.federicoparezzan.chapters.four;

import org.junit.Test;
import static org.junit.Assert.*;

public class CheckPhoneTest {

    /*
        Task: Write a regular expression which matches any phone number.
              A phone number in this example consists either out of 7 numbers in a row or out of 3 number,
              a (white)space or a dash and then 4 numbers.
     */

    @Test
    public void testCheckPhone() {
        String regex = "[\\d]{3}[\\s]?[\\d]{4}";

        String phone = "1234567";
        assertTrue(phone.matches(regex));
        phone = "123 4567";
        assertTrue(phone.matches(regex));
        phone = "765 4321";
        assertTrue(phone.matches(regex));
        phone = "1234567890";
        assertFalse(phone.matches(regex));
        phone = "123 4567890";
        assertFalse(phone.matches(regex));
        phone = "abcdefgh";
        assertFalse(phone.matches(regex));
    }

}
