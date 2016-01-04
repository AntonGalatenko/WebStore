package com.toxa.webstore5.controller;

import com.toxa.webstore5.model.TestClass;
import com.toxa.webstore5.model.entity.Users;
import com.toxa.webstore5.model.repository.Repository;
import com.toxa.webstore5.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @Autowired
    private Repository repository;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = {"/", "/index**"})
    public ModelAndView homePage(){
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("list", repository.getAllItems());
//        modelAndView.addObject("user", repository.getUser(1));
        return modelAndView;
    }

    @RequestMapping(value = "/login**")
    public ModelAndView loginPage(){
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/register**", method = RequestMethod.GET)
    public ModelAndView registerPage(){
        return new ModelAndView("register");
    }

    @RequestMapping(value = "/register**", method = RequestMethod.POST)
    public ModelAndView register(@RequestParam(value = "first_name") String firstName,
                                 @RequestParam(value = "last_name") String lastName,
                                 @RequestParam(value = "email") String email,
                                 @RequestParam(value = "age") String age,
                                 @RequestParam(value = "password") String password
                                 ) {
        Users user = new Users(firstName, lastName, Integer.parseInt(age), email, password, userRepository.getUserProfile("USER"));
        userRepository.addUser(user);
//        repository.setProfileAsUser(user);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/getUser", method = RequestMethod.POST)
    public @ResponseBody Users getUser(@RequestParam int id){
        Users user = userRepository.getUser(id);
        System.out.println("USER " + user.getEmail());
        return user;
    }

    @RequestMapping(value = "/test", method = RequestMethod.POST)
//    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody TestClass t(@RequestParam int id){

        System.out.println("!!!!!");

        TestClass testClass = new TestClass();
        testClass.setName("Антон");
        testClass.setStaffName(new String[]{"Галат", "Старший"});
        return testClass;
    }
}
