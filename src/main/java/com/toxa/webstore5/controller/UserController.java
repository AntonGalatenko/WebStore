package com.toxa.webstore5.controller;


import com.toxa.webstore5.model.entity.Users;
import com.toxa.webstore5.model.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/getUserInfo")
    public @ResponseBody
    String users(/*HttpServletRequest request, @RequestParam int id*/){
//        Cookie cookie[] = request.getCookies();
//        for(int i = 0; i < cookie.length; i++){
//            System.out.println(cookie[i].getValue());
//        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String email = auth.getName();
        System.out.println("auth.getName() " + email);

        Users users = userRepository.getUser(email);

        return users.toString();
    }
}
