package test.com.federicoparezzan.chapters.four;

import com.federicoparezzan.chapters.four.EitherOrCheck;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class EitherOrCheckTest {

    /*
    Task: Write a regular expression which matches a text line if this text line contains either the word "Joe" or
          the word "Jim" or both.
     */

    @Test
    public void testEitherOr(){
        String regex = ".*(Jim|Joe).*";

        String m = "Jim hello, how are you?";
        assertTrue(m.matches(regex));
        m = "Jimhello, how are you?";
        assertTrue(m.matches(regex));
        m = "hello jim, how are you?";
        assertFalse(m.matches(regex));
        m = "hello, how are you?";
        assertFalse(m.matches(regex));
        m = "hello guys, how are you?";
        assertFalse(m.matches(regex));
        m = "hello Jim and Joe, how are you?";
        assertTrue(m.matches(regex));
        m = "hello JimJoe, how are you?";
        assertTrue(m.matches(regex));
        m = "hello jimjoe, how are you?";
        assertFalse(m.matches(regex));
        m = "hello tom and frank, how are you?";
        assertFalse(m.matches(regex));

    }

}
