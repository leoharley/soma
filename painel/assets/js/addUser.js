/**
 * File : addUser.js
 * 
 * This file contain the validation of add user form
 * 
 * Using validation plugin : jquery.validate.js
 * 
 * @author Kishor Mali
 */

$(document).ready(function(){
	
	var addUserForm = $("#addUser");
	
	var validator = addUserForm.validate({
		
		rules:{
			fname :{ required : true },
			email : { required : true, email : true, remote : { url : baseURL + "checkEmailExists", type :"post"} },
			ds_senha : { required : true },
			resenha : {required : true, equalTo: "#ds_senha"},
			mobile : { required : true, digits : true },
			role : { required : true, selected : true}
		},
		messages:{
			fname :{ required : "Campo obrigatório" },
			email : { required : "Campo obrigatório", email : "Favor informar um e-mail válido", remote : "E-mail já existe" },
			ds_senha : { required : "Campo obrigatório" },
			resenha : {required : "Campo obrigatório", equalTo: "Senha não é igual" },
			mobile : { required : "Campo obrigatório", digits : "Somente números" },
			role : { required : "Campo obrigatório", selected : "Favor selecionar apenas 1 opção" }			
		}
	});
});
