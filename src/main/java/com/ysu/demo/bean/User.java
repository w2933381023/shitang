package com.ysu.demo.bean;


import lombok.*;

@Data@Setter@Getter@NoArgsConstructor@AllArgsConstructor@ToString
public class User {
    private Integer userId;
    private String userName;
    private String password;
    private String userTrueName;
    private String phoneNumber;
    private Integer roleId;
}
