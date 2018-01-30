package mapper;

import pojo.Person;

import java.util.List;

public interface PersonMapper {
    public void add(pojo.Person person);
    public void delete(Person person);
    public void update(Person person);
    public List<pojo.Person> search();
    public int get(String name);
}
