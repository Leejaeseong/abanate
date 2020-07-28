package com.abanate.kokomath.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abanate.kokomath.domain.KokoVisitLog;

public interface KokoVisitLogRepo extends JpaRepository<KokoVisitLog, Long> {
}