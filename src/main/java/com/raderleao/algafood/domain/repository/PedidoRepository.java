package com.raderleao.algafood.domain.repository;

import org.springframework.stereotype.Repository;

import com.raderleao.algafood.domain.model.Pedido;

@Repository
public interface PedidoRepository extends CustomJpaRepository<Pedido, Long> {

}   