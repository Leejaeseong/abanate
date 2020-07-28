package com.abanate.com.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class RecaptchaService {

	@SuppressWarnings("unchecked")
	public Map<String, Object> token(String token, String SETTING_API_RECAPTCHA_SECRET_KEY) {
		String url = "https://www.google.com/recaptcha/api/siteverify";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_FORM_URLENCODED) ;

        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("secret", SETTING_API_RECAPTCHA_SECRET_KEY );
        map.add("response", token);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
        
        Map<String, Object> response = restTemplate.postForObject( url, request, HashMap.class );        

        return response;
    }


}
