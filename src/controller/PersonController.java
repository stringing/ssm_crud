package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.Person;
import service.PersonService;
import util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("")
public class PersonController {
    @Autowired
    PersonService personService;

    @RequestMapping("add")
    public ModelAndView add(Person person){
        personService.add(person);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add");
        return modelAndView;
    }

    @RequestMapping("update")
    public ModelAndView update(Person person){
        personService.update(person);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("update");
        return mav;
    }

    @RequestMapping("delete")
    public ModelAndView delete(Person person){
        personService.delete(person);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("delete");
        return mav;
    }

    @RequestMapping("search")
    public ModelAndView search(Page page){
        ModelAndView mav = new ModelAndView();
        PageHelper.offsetPage(page.getStart(),5);
        List<Person> list = personService.search();
        int total = (int)new PageInfo<>(list).getTotal();
        page.caculateLast(total);
        mav.addObject("list",list);
        mav.setViewName("search");
        return mav;
    }

    @RequestMapping("Validate")
    public void validate(HttpServletRequest request,HttpServletResponse response){
        String name = request.getParameter("name");
        int age = personService.get(name);
        if(age==0) {
            try {
                response.getWriter().write("1");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.getWriter().write("0");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
