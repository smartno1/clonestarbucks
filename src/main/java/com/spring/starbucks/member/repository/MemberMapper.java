package com.spring.starbucks.member.repository;


import com.spring.starbucks.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MemberMapper {

    // 회원 가입 기능
    boolean register(Member member);

    //정보 수정 기능
    boolean update(Member member);

    // 중복체크 기능
    // 체크타입: 계정 or 이메일 or 전화번호
    // 체크값: 중복검사대상 값
    int isDuplicate(Map<String, Object> checkMap);

    // 회원 조회 기능
    Member findUser(String account);

    Member findUser2(Map<String, Object> checkMap);

}
