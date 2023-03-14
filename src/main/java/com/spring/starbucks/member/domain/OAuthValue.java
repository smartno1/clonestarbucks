package com.spring.starbucks.member.domain;

public interface OAuthValue {

    String KAKAO_APP_KEY = "";
    String KAKAO_REDIRECT_URI = "/oauth/kakao";
//http://ec2-13-124-112-208.ap-northeast-2.compute.amazonaws.com
    String KAKAO_JAVASCRIPT_KEY = "";

    String GOOGLE_CLIENT_SECRET = "";
    String GOOGLE_REDIRECT_URI = "/oauth/google";

    String GOOGLE_CLIENT_ID = "";

    String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
}
