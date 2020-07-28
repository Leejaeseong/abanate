package com.abanate.mycoup.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.abanate.mycoup.domain.CmUsr;
import com.abanate.mycoup.repo.custom.CustomNqueryRepo;

public interface NqueryRepo extends JpaRepository<CmUsr, Long>, JpaSpecificationExecutor<CmUsr>, CustomNqueryRepo {
}