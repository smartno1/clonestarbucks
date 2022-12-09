package com.spring.starbucks.member.service;

import com.spring.starbucks.member.domain.Auth;
import com.spring.starbucks.member.domain.Gender;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.repository.MemberMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberServiceTest {

    @Autowired
    MemberService service;

    @Autowired
    MemberMapper mapper;


    @Test
    @DisplayName("평문 비밀번호로 회원가입하면 암호화되어 저장된다.")
    void signUpTest() {

        Member m = new Member();

        m.setAccount("banana");
        m.setPassword("1234");
        m.setNickname("banana");
        m.setName("버내나");
        m.setPhone("010-1834-1834");
        m.setBirthYear(1955);
        m.setBirthMonth(07);
        m.setBirthDay(24);
        m.setEmail("banana@gmail.com");
        m.setGender(Gender.M);
        m.setAuth(Auth.COMMON);


        service.signUp(m);

        Member m2 = mapper.findUser("banana");

        System.out.println("encodePassword : " + m2.getPassword());

    }


    @Test
    @DisplayName("중복된 아이디를 전달하면 true가 나와야 한다.")
    void checkAccountServiceTest() {

        //given
        String account = "banana";

        //when
        boolean flag = service.checkSignUpValue("account", account);

        //then
        assertTrue(flag);

    }

}