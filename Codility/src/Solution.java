import java.util.*;

;

public class Solution
{
    public static int orchard(int[]A , int k, int l)
    {
        if (k + l > A.length)
        {
            return -1;
        }

        ArrayList<Integer> ps = new ArrayList<>();
        ps.add(0);
        ps(A.iterator(),trees.end(),back_inserter(ps));
        ArrayList<Integer> alice = new ArrayList<Integer>(ps.size());
        ArrayList<Integer> bob = new ArrayList<Integer>(ps.size());
        for (int i = k; i < ps.size(); ++i)
        {
            alice.set(i, Math.max(alice.get(i - 1),ps.get(i) - ps.get(i - k)));
        }


        bob.set(ps.size() - 1, ps.get(ps.size() - 1) - ps.get(ps.size() - 1 - l));
        for (int i = ps.size() - 2; i >= l; --i)
        {
            bob.set(i, Math.max(bob.get(i + 1),ps.get(i) - ps.get(i - l)));
        }

        int maxSoFar = bob.get(0);
        for (int i = 0; i < ps.size() - 1; ++i)
        {
            maxSoFar = Math.max(maxSoFar,alice.get(i) + bob.get(i + 1));
        }

        return maxSoFar;
    }
}
