package com.ysu.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//设置默认访问页面
@Configuration
public class WebConfigurer implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //默认地址（可以是页面或后台请求接口）
        registry.addViewController("/").setViewName("forward:/login.jsp");
        //设置过滤优先级最高
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }
}
