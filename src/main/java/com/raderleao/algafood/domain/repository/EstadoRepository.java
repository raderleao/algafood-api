package com.raderleao.algafood.domain.repository;

import org.springframework.stereotype.Repository;

import com.raderleao.algafood.domain.model.Estado;

@Repository
public interface EstadoRepository extends CustomJpaRepository<Estado, Long>{
	
}
