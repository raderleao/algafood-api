package com.raderleao.algafood.domain.repository;

import org.springframework.stereotype.Repository;

import com.raderleao.algafood.domain.model.Grupo;

@Repository
public interface GrupoRepository extends CustomJpaRepository<Grupo, Long>{
	
}
