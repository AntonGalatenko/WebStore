package com.toxa.webstore5.controller;

import com.toxa.webstore5.model.entity.Users;
import com.toxa.webstore5.model.repository.Repository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminController {

    private final Repository repository = new Repository();

//    @RequestMapping(value = "admin/getitem")
//    public String

    @RequestMapping(value = "/admin**")
    public ModelAndView adminPage(){
        List<Users> usersList = repository.getAllUsers();
//        usersList.get(5).getUsersProfile().
        return new ModelAndView("admin", "list15", usersList);
    }


}
