import java.lang.reflect.Array;
import java.util.*;

public class Exercuse {
    public List<Integer> findDuplicates(List<Integer> integers, int numberOfDuplicates) {
       List<Integer> result = new List<>() {
           @Override
           public int size() {
               return 0;
           }

           @Override
           public boolean isEmpty() {
               return false;
           }

           @Override
           public boolean contains(Object o) {
               return false;
           }

           @Override
           public Iterator<Integer> iterator() {
               return null;
           }

           @Override
           public Object[] toArray() {
               return new Object[0];
           }

           @Override
           public <T> T[] toArray(T[] ts) {
               return null;
           }

           @Override
           public boolean add(Integer integer) {
               return false;
           }

           @Override
           public boolean remove(Object o) {
               return false;
           }

           @Override
           public boolean containsAll(Collection<?> collection) {
               return false;
           }

           @Override
           public boolean addAll(Collection<? extends Integer> collection) {
               return false;
           }

           @Override
           public boolean addAll(int i, Collection<? extends Integer> collection) {
               return false;
           }

           @Override
           public boolean removeAll(Collection<?> collection) {
               return false;
           }

           @Override
           public boolean retainAll(Collection<?> collection) {
               return false;
           }

           @Override
           public void clear() {

           }

           @Override
           public Integer get(int i) {
               return null;
           }

           @Override
           public Integer set(int i, Integer integer) {
               return null;
           }

           @Override
           public void add(int i, Integer integer) {

           }

           @Override
           public Integer remove(int i) {
               return null;
           }

           @Override
           public int indexOf(Object o) {
               return 0;
           }

           @Override
           public int lastIndexOf(Object o) {
               return 0;
           }

           @Override
           public ListIterator<Integer> listIterator() {
               return null;
           }

           @Override
           public ListIterator<Integer> listIterator(int i) {
               return null;
           }

           @Override
           public List<Integer> subList(int i, int i1) {
               return null;
           }
       };
        for(int i = 0; i< integers.size(); i++)
        {
            int count = 0;
            for(int j =0; j<integers.size(); j++)
            {
                if(integers.get(i).equals(integers.get(j)))
                {
                    count++;
                }
            }
            if(count == numberOfDuplicates && integers.get(i) != null)
            {
                result.add(integers.get(i));
            }

        }

        return result;
    }
}
