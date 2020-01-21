/**
 * 
 */
$(document).ready(function() {
    console.log('ready');
    init();
});

function init(){
   onshowproductos();
}

function onshowproductos(){
	$('#deletealumno').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var nombre = button.data('nombre')
	  var dni = button.data('dni')
	  var i = button.data('posicion')
	  var modal = $(this)
	  modal.find('.modal-body span').text(nombre)
	  modal.find('.modal-footer a').attr("href", "Controller?op=deletealumno&dni="+dni+"&i="+i);
	})
}