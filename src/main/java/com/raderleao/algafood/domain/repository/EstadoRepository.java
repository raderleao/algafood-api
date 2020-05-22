package com.raderleao.algafood.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.raderleao.algafood.domain.model.Estado;

@Repository
public interface EstadoRepository extends JpaRepository<Estado, Long>{
	
}
