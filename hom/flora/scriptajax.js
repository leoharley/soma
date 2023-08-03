$(document).ready(() => {
  $.ajax({
    type: 'POST',
    url: 'buscaFamilia.php',
    dataType: 'json',
    success: dados => {
        var option;	
        option += '<option>'+ 'Selecione a família' +'</option>';		
        if (dados.length > 0){
          $.each(dados, function(i, obj){
            option += `<option value =${obj.id}>${obj.nome}</option>`;
          })
        }
        $('#familia').html(option).show();
    }		
  }) 

  $('#familia').on('change', e => {	
    let familia = $(e.target).val()
    $.ajax({
        type: 'POST',
        url: 'buscaGenero.php',
        data: 'familia='+familia, //x-www-form-urlencoded	
        dataType: 'json',
        success: dados => {
            var option;	
            option += '<option>'+ 'Selecione o gênero' +'</option>';		
            if (dados.length > 0){
              $.each(dados, function(i, obj){
                option += `<option value =${obj.id}>${obj.nome}</option>`;
              })
            }
            $('#genero').html(option).show();
        }		
    }) 
  }) 

  $('#genero').on('change', e => {	
    let genero = $(e.target).val()
    $.ajax({
        type: 'POST',
        url: 'buscaEspecie.php',
        data: 'genero='+genero, //x-www-form-urlencoded	
        dataType: 'json',
        success: dados => {
            var option;	
            option += '<option>'+ 'Selecione a espécie' +'</option>';		
            if (dados.length > 0){
              $.each(dados, function(i, obj){
                option += `<option value =${obj.id}>${obj.nome} - Nome popular:${obj.no_popular} / Nome científico: ${obj.no_cientifico} </option>`;
              })
            }
            $('#especie').html(option).show();
        }		
    }) 
  })


})

