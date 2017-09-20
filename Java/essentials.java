import java.util.*;

public class Program {
    public static void main(String[] args) {
        String abc[] = new String[]{"ching", "chong", "chang"};
        String message =
            new Random()
            .ints(streamSize: 100, randomNumberOrigin: 0, randomNumberBound: 3)
            .mapToObj(i -> abc[i])
            .collect(Collectors.joining(delimeter:" "));
        System.out.println(message);
    }
}
