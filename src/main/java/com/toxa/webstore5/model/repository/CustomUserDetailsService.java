package com.toxa.webstore5.model.repository;

import com.toxa.webstore5.model.entity.Users;
import com.toxa.webstore5.model.entity.UsersProfile;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
       Users user = new Repository().getUser(email);

        if(user==null){
            System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }

        System.out.println("User email : " + user.getEmail());

        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
                true, true, true, true, getGrantedAuthorities(user));
    }

    private List<GrantedAuthority> getGrantedAuthorities(Users user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        for(UsersProfile userProfile : user.getUsersProfile()){
//            System.out.println("UserProfile : " + userProfile);
            authorities.add(new SimpleGrantedAuthority("ROLE_"+userProfile.getType()));
        }
        System.out.println("authorities : " + authorities);
        return authorities;
    }
}
