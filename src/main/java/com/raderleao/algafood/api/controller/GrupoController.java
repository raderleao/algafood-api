package com.raderleao.algafood.api.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.raderleao.algafood.api.assembler.GrupoInputDisassembler;
import com.raderleao.algafood.api.assembler.GrupoModelAssembler;
import com.raderleao.algafood.api.model.GrupoModel;
import com.raderleao.algafood.api.model.input.GrupoInput;
import com.raderleao.algafood.domain.model.Grupo;
import com.raderleao.algafood.domain.repository.GrupoRepository;
import com.raderleao.algafood.domain.service.CadastroGrupoService;

@RestController
@RequestMapping("/grupos")
public class GrupoController {

	@Autowired
	private GrupoRepository grupoRepository;

	@Autowired
	private CadastroGrupoService cadastroGrupo;
	
	@Autowired
	private GrupoModelAssembler grupoModelAssembler;

	@Autowired
	private GrupoInputDisassembler grupoInputDisassembler;   

	@GetMapping
	private List<Grupo> listar() {
		return grupoRepository.findAll();
	}
	
	@GetMapping("/{grupoId}")
	public GrupoModel buscar(@PathVariable("grupoId") Long grupoId) {
		Grupo grupo = cadastroGrupo.buscarOuFalhar(grupoId);
	    
	    return grupoModelAssembler.toModel(grupo);
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public GrupoModel adicionar(@RequestBody @Valid GrupoInput grupoInput) {
		Grupo grupo = grupoInputDisassembler.toDomainObject(grupoInput);
	    
		grupo = cadastroGrupo.salvar(grupo);
	    
	    return grupoModelAssembler.toModel(grupo);
	}

	@PutMapping("/{grupoId}")
	public GrupoModel  atualizar(@PathVariable Long grupoId, @RequestBody @Valid GrupoInput grupoInput) {
		Grupo grupo = cadastroGrupo.buscarOuFalhar(grupoId);
	    
		grupoInputDisassembler.copyToDomainObject(grupoInput, grupo);
	    
		grupo = cadastroGrupo.salvar(grupo);
	    
	    return grupoModelAssembler.toModel(grupo);
	}

	@DeleteMapping("/{grupoId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long grupoId) {
		cadastroGrupo.excluir(grupoId);
	}

}
