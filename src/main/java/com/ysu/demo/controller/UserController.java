package com.ysu.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.ysu.demo.bean.Shop;
import com.ysu.demo.bean.User;
import com.ysu.demo.service.ShopService;
import com.ysu.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ShopService shopService;


@RequestMapping(value = "/shopLogin")
public String shopLogin(User user,HttpSession session){
    User user1 = userService.userIsLogin(user);
    if (user1!=null&&user1.getRoleId()==0){
        System.out.println(user1);
        Shop shop = shopService.queryShopById(user1.getUserId());
        session.setAttribute("shop", shop);
        session.setAttribute("shopuser", user1);
            return "redirect:/shopindex.jsp";
    }else {
        session.setAttribute("error_mess","用户名或密码不正确！");
        return "redirect:/login.jsp";
    }
}

    @RequestMapping(value = "/adminLogin")
    public String adminLogin(User user,HttpSession session){
        User user1 = userService.userIsLogin(user);
        if (user1!=null&&user1.getRoleId()==1){
            User user2 = userService.queryUserById(user1.getUserId());
            session.setAttribute("admin", user2);
            return "redirect:/index.jsp";
        }else {
            session.setAttribute("error_mess","用户名或密码不正确！");
            return "redirect:/login.jsp";
        }
    }


  @RequestMapping(value = "/insertUser")
    public String insertUser(User user, HttpSession session, HttpServletRequest request){
      User user1 = userService.userIsExist(user);
      if(user1==null){
          System.out.println("successs!!!!!!!!!!!!!");
          userService.insertUser(user);
          return "login";
      }else
        return "login";
}


    @RequestMapping(value = "/deleteUser")
    public String deleteUser(Integer userId) {
        userService.deleteUser(userId);
        return "redirect:queryUserByPage2.action";
    }

    @RequestMapping(value = "/queryUserByPage")
    public String queryUserByPage(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model) {
        List<User> users=new ArrayList<>();
        PageHelper.startPage(pn,5);
        users=userService.queryAllUser();
        PageInfo pageInfo=new PageInfo(users,5);
        model.addAttribute("pageinfo", pageInfo);
        return "user";
    }

    @RequestMapping(value = "/queryUserByPage2")
    public String queryUserByPage2(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model,User user) {
        List<User> users=new ArrayList<>();
        PageHelper.startPage(pn,5);
        users=userService.queryUserByName(user.getUserName());
        PageInfo pageInfo=new PageInfo(users,5);
        model.addAttribute("pageinfo", pageInfo);
        return "user";
    }
    @RequestMapping(value = "/userSafe")
    public String userSafe(User user,HttpSession session,HttpServletRequest request) {
        User user2=(User)session.getAttribute("user");
        System.out.println(user2);
        user.setUserId(user2.getUserId());
      String oldpassword=(String)request.getParameter("oldpassword");
       String password = user2.getPassword();
        System.out.println(user2.getPassword());
        if(password.equals(oldpassword))
        {
            System.out.println("xxx");
            userService.userSafe(user);
            System.out.println("www");
            session.setAttribute("sucess_mess","修改成功");
            return "redirect:/jsp/login.jsp";
        }
        else {
            session.setAttribute("sucess_mess","修改失败");
            return "index";
        }
    }
    @RequestMapping(value = "/exitUser")
    public String exitUser(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/jsp/login.jsp";
    }


}
