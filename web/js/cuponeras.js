CATEGORIA = {};

CATEGORIA.desplegar = function () {
    
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'CategoriaController');    
    xhr.onreadystatechange = function () {
        
        if (xhr.readyState == 4 && xhr.status == 200) {
            var templateCategorias = document.querySelector("#templateCategorias").innerHTML;
            var categorias = {};
            categorias.listaCategorias = JSON.parse(xhr.responseText);
            document.querySelector('#verCategorias').innerHTML = Mustache.render(templateCategorias, categorias);
        }
        
    };
    
    xhr.send(null);
};



CATEGORIA.desplegar();