package com.poka.proc;

import java.net.URI;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class KaKaoVisionTag {

	
public String addBoardVisionTag(String link) throws Exception {
		
		RestTemplate restTemplate = new RestTemplate();

        //Body
        MultiValueMap<String,String> params = new LinkedMultiValueMap<String,String>();
        params.add("image_url",link);
        
        //Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization","KakaoAK "+"ba4cb63601508f24d7800dc383e44fa4");
       
        HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<MultiValueMap<String,String>>(params, headers);
        Map response = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/vision/multitag/generate"), request, Map.class);
       
        System.out.println(response);
        
        String result=response.get("result").toString();
                
        String[] split=result.split("\\[");
		
		String aaa=split[2];
		
		String bbb=aaa.replace("]", "").replace("}", "").replace(", ", "#");
		
		String ddd="#"+bbb;
		
		String eee=URLEncoder.encode(ddd, "utf-8");
		
		System.out.println(ddd);
		
		return eee;
	}

	
	
}
