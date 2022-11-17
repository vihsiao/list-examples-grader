import static org.junit.Assert.*;

import java.util.*;

import org.junit.*;

public class TestListExamples {
  @Test
    public void testFilter() {
        List<String> list1 = new ArrayList<String>(Arrays.asList("pineapple", "grape", "apple", "snapple", "banana", "grapple"));
        StringChecker sc = new StringChecker() {
            @Override
            public boolean checkString(String s) {
                if (s.contains("app")) {
                    return true;
                }
                return false;
            }
        };

        List<String> list2 = ListExamples.filter(list1,sc);

        assertArrayEquals(new String[]{"pineapple", "apple", "snapple", "grapple"}, list2.toArray());
    }
}
