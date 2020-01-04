import java.util.List;
import static java.util.Arrays.asList;
public class Main {
    public static void main(String[] args) {
        Exercuse exercise = new Exercuse();

        // when
        List<Integer> result = exercise.findDuplicates(asList(1, 1, null, 2, 5, 6, 1, 3, 6, null), 2);

        System.out.println(result.get(1));
        System.out.println(result.get(2));
        System.out.println(result.get(0));
        System.out.println(result.get(3));



    }
}
