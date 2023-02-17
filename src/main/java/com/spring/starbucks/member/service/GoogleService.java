package com.spring.starbucks.member.service;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;

import com.spring.starbucks.member.domain.Gender;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.dto.GoogleOAuthRequest;
import com.spring.starbucks.member.dto.GoogleOAuthResponse;
import com.spring.starbucks.member.dto.KaKaoUserInfoDTO;
import lombok.extern.log4j.Log4j2;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Map;

import static com.spring.starbucks.member.domain.OAuthValue.*;

@Service
@Log4j2
public class GoogleService  {
//
//
//    public Member getGoogleUserInfo(String authCode) throws Exception {
//
//
//
//        // 1. 액세스 토큰을 발급 요청할 URI
//        String reqUri = "https://oauth2.googleapis.com/tokeninfo";
//
//        reqUri += "?id_token="+authCode;
//
//        // 2. server to server 요청
//        // 2-a. 문자타입의 URL을 객체로 포장
//        URL url = new URL(reqUri);
//
//        // 2-b. 해당 요청을 연결하고 그 연결정보를 담을 Connection객체 생성
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//
//        conn.setDoOutput(true); // 응답 결과를 받겠다.
//
//        Member member = new Member();
//
//        // 3. 응답 데이터 받기
//        try(BufferedReader br
//                    = new BufferedReader(
//                new InputStreamReader(conn.getInputStream(),"UTF-8")))  {
//
//            String responseData = br.readLine();
//
//            // 3-b. 응답받은 json을 gson라이브러리를 사용하여 자바 객체로 파싱
//            JsonParser parser = new JsonParser();
//            // JsonElement는 자바로 변환된 JSON
//            JsonElement element = parser.parse(responseData);
//
//            // 3-c. json 프로퍼티 키를 사용해서 필요한 데이터 추출
//            JsonObject jsonObject = element.getAsJsonObject();
//
//            member.setEmail(String.valueOf(jsonObject.get("email")));
//            member.setName(String.valueOf(jsonObject.get("name")));
//            member.setPassword("google");
//            member.setBirthYear(1900);
//            member.setBirthMonth(0);
//            member.setBirthDay(0);
//            member.setNickname(String.valueOf(jsonObject.get("name")));
//            member.setPhone("000-0000-0000");
//            member.setGender(Gender.M);
//
//            return member;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return null;
//    }
//
//
//    private static void sendAccessTokenRequest(String authCode, HttpURLConnection conn) throws IOException {
//
//
//        // 2-d. 요청 파라미터 추가
//        try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"))) {
//
//            StringBuilder queryParam = new StringBuilder();
//
//            // 출력스트림을 이용해서 파라미터 전송
//            bw.write(queryParam.toString());
//            // 출력 버퍼 비우기
//            bw.flush();
//
//            // 응답 상태코드 확인
//            int responseCode = conn.getResponseCode();
//            log.info("response code - {}", responseCode);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//


    public String getAccessToken(String authCode, ObjectMapper mapper, RestTemplate restTemplate) throws Exception {


        GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
                .builder()
                .clientId(GOOGLE_CLIENT_ID)
                .clientSecret(GOOGLE_CLIENT_SECRET)
                .code(authCode)
                .redirectUri("http://localhost:8183"+GOOGLE_REDIRECT_URI)
                .grantType("authorization_code").build();


        mapper.setPropertyNamingStrategy(PropertyNamingStrategies.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        log.info("구글 리퀘스트 파라미터 - {} ",googleOAuthRequestParam);
        ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam, String.class);

        GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
        });


        log.info("token : {}",result.getAccessToken());

        String jwtToken = result.getIdToken();

        return jwtToken;
    }


    public Member getGoogleUserInfo(String accessToken,  ObjectMapper mapper, RestTemplate restTemplate) throws Exception {

        String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
                .queryParam("id_token", accessToken).encode().toUriString();

        String resultJson = restTemplate.getForObject(requestUrl, String.class);

        Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
        log.info("유저 정보 - {} ",userInfo);


        Member member = new Member();


        member.setEmail(String.valueOf(userInfo.get("email")));
        member.setName(String.valueOf(userInfo.get("name")));
        member.setPassword("google");
        member.setBirthYear(1900);
        member.setBirthMonth(0);
        member.setBirthDay(0);
        member.setNickname(String.valueOf(userInfo.get("name")));
        member.setPhone("000-0000-0000");
        member.setGender(Gender.M);

        return member;

    }

}
