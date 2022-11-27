import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

    @Test
    public void testMerge() {
        List<String> list1 = new ArrayList<String>(Arrays.asList("a", "b", "e", "g", "h"));
        List<String> list2 = new ArrayList<String>(Arrays.asList("c", "d", "f", "i", "j"));
        List<String> result = ListExamples.merge(list1, list2);
        assertArrayEquals(new String[]{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"}, result.toArray());
    }
}
