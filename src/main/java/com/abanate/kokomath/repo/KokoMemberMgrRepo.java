package com.abanate.kokomath.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.kokomath.domain.KokoMemberMgr;

public interface KokoMemberMgrRepo extends JpaRepository<KokoMemberMgr, Long>, JpaSpecificationExecutor<KokoMemberMgr>, KokoMemberMgrRepoI {
}