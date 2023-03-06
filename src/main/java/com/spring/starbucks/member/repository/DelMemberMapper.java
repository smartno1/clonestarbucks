package com.spring.starbucks.member.repository;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.member.domain.DelMember;
import com.spring.starbucks.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DelMemberMapper {

    //  탈퇴 회원 등록 기능
    boolean delAccountRegister(Member member);

    //정보 수정 기능
    boolean delAccountUpdate(DelMember member);

    // 중복체크 기능
    // 체크타입: 계정 or 이메일 or 전화번호
    // 체크값: 중복검사대상 값
    int isDuplicate(Map<String, Object> checkMap);

    // 회원 조회 기능
    DelMember delAccountFind(String account);

    DelMember delAccountFind2(Map<String, Object> checkMap);

    List<DelMember> findAll(Search search);

    boolean delAccountDelete(String account);

    int getTotalCount(Search search);
}
