package com.ysu.demo.push;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import java.util.HashMap;
import java.util.Map;
@Controller
@Slf4j
public class PushController {
    private String appID = "wxc53cddcd31b3a812";
    private String appSecret = "187cd07141a4b23984ab65930e5eebe4";
   @ResponseBody
   @GetMapping("/getAccessToken")
   //获取AccessToken
   public String getAccessToken() {
       RestTemplate restTemplate = new RestTemplate();
       Map<String, String> params = new HashMap<>();
       params.put("APPID",appID);  //这里替换成你的appid
       params.put("APPSECRET", appSecret);  //这里替换成你的appsecret
       ResponseEntity<String> responseEntity = restTemplate.getForEntity(
               "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={APPID}&secret={APPSECRET}", String.class, params);
       String body = responseEntity.getBody();
       AccessToken object = new Gson().fromJson(body, AccessToken.class);
       log.info("返回的AccessToken={}", object);
       String Access_Token = object.getAccess_token();
       return Access_Token;
   }
}
