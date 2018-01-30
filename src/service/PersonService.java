package service;

import mapper.PersonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Person;

import java.util.List;

@Service
public class PersonService {
    @Autowired
    PersonMapper personMapper;
    public void add(Person person){
        personMapper.add(person);
    }
    public void delete(Person person){
        personMapper.delete(person);
    }
    public void update(Person person){
        personMapper.update(person);
    }
    public List<Person> search(){
        return personMapper.search();
    }
    public int get(String name){
        return personMapper.get(name);
    }
}
