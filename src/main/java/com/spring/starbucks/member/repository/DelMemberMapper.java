package com.spring.starbucks.member.repository;

import com.spring.starbucks.member.domain.DelMember;
import com.spring.starbucks.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface DelMemberMapper {

    //  탈퇴 회원 등록 기능
    boolean delAccountRegister(Member member);

    //정보 수정 기능
    boolean delAccountUpdate(DelMember member);

    // 회원 조회 기능
    DelMember delAccountFind(String account);

    DelMember delAccountFind2(Map<String, Object> checkMap);

    boolean delAccountDelete(String account);
}
