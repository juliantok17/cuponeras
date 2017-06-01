CATEGORIA = {};

CATEGORIA.desplegar = function () {
    
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'CategoriaController');    
    xhr.onreadystatechange = function () {
        
        if (xhr.readyState == 4 && xhr.status == 200) {
            var templateCategorias = document.querySelector("#templateCategorias").innerHTML;
            var modeloCategorias = {};
            modeloCategorias.listaCategorias = JSON.parse(xhr.responseText);
            document.querySelector('#verCategorias').innerHTML = Mustache.render(templateCategorias, modeloCategorias);
        }
        
    };
    
    xhr.send(null);
};

CATEGORIA.porId = function(){
    
    var categoriaSeleccionada = document.querySelector('#verCategorias').value; 
    
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'ProductoController?id='+categoriaSeleccionada);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var templateProductos = document.querySelector("#templateProductos").innerHTML;
            var modeloProductos = {};
            modeloProductos.listaProductos = JSON.parse(xhr.responseText);
            document.querySelector('#resultado').innerHTML = Mustache.render(templateProductos, modeloProductos);
            //var resultado = xhr.responseText;
            
        } else{
            
        }
    };

    xhr.send();   
};

CATEGORIA.desplegar();