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

import com.raderleao.algafood.api.assembler.UsuarioInputDisassembler;
import com.raderleao.algafood.api.assembler.UsuarioModelAssembler;
import com.raderleao.algafood.api.model.UsuarioModel;
import com.raderleao.algafood.api.model.input.SenhaInput;
import com.raderleao.algafood.api.model.input.UsuarioComSenhaInput;
import com.raderleao.algafood.api.model.input.UsuarioInput;
import com.raderleao.algafood.domain.model.Usuario;
import com.raderleao.algafood.domain.repository.UsuarioRepository;
import com.raderleao.algafood.domain.service.CadastroUsuarioService;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private CadastroUsuarioService cadastroUsuario;
	
	@Autowired
	private UsuarioModelAssembler usuarioModelAssembler;

	@Autowired
	private UsuarioInputDisassembler usuarioInputDisassembler;   

	@GetMapping
	private List<Usuario> listar() {
		return usuarioRepository.findAll();
	}
	
	@GetMapping("/{usuarioId}")
	public UsuarioModel buscar(@PathVariable("usuarioId") Long usuarioId) {
		Usuario usuario = cadastroUsuario.buscarOuFalhar(usuarioId);
	    
	    return usuarioModelAssembler.toModel(usuario);
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public UsuarioModel adicionar(@RequestBody @Valid UsuarioComSenhaInput usuarioComSenhaInput) {
		Usuario usuario = usuarioInputDisassembler.toDomainObject(usuarioComSenhaInput);
	    
		usuario = cadastroUsuario.salvar(usuario);
	    
	    return usuarioModelAssembler.toModel(usuario);
	}	

	@PutMapping("/{usuarioId}")
	public UsuarioModel  atualizar(@PathVariable Long usuarioId,
			@RequestBody @Valid UsuarioInput usuarioInput) {
		Usuario usuario = cadastroUsuario.buscarOuFalhar(usuarioId);
	   	usuarioInputDisassembler.copyToDomainObject(usuarioInput, usuario);
	    usuario = cadastroUsuario.salvar(usuario);
	    
	    return usuarioModelAssembler.toModel(usuario);
	}

	@DeleteMapping("/{usuarioId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long usuarioId) {
		cadastroUsuario.excluir(usuarioId);
	}
	
	@PutMapping("/{usuarioId}/senha")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void alterarSenha (@PathVariable Long usuarioId, @RequestBody @Valid SenhaInput senha) {
		cadastroUsuario.alterarSenha(usuarioId, senha.getSenhaAtual(), senha.getNovaSenha());
	}

}
