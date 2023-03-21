package com.spring.starbucks.member.repository;


import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.member.domain.DelMember;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.dto.AutoLoginDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapper {

    // 회원 가입 기능
    boolean register(Member member);

    // 회원 복구기능
    boolean recovery(DelMember member);

    //정보 수정 기능
    boolean update(Member member);

    // 중복체크 기능
    // 체크타입: 계정 or 이메일 or 전화번호
    // 체크값: 중복검사대상 값
    int isDuplicate(Map<String, Object> checkMap);

    // 회원 조회 기능
    Member findUser(String account);

    List<Member> findAll(Search search);

    Member findUser2(Map<String, Object> checkMap);

    boolean deleteUser(String account);

    int getTotalCount(Search search);

    // 자동로그인 쿠키정보 저장
    void saveSessionValue(AutoLoginDTO dto);

    // 쿠키값(세션아이디)을 가지고 있는 회원정보 조회
    Member findMemberBySessionId(String sessionId);

}
