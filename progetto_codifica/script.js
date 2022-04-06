$(document).ready(function() {
  $('.zoom').magnify({
    speed: 100,
  });
});

var edizione = 'diplomatica';

function edizioni (){
	var dipl = document.getElementsByClassName('diplomatica');
	var	inte = document.getElementsByClassName('interpretativa');
	var b= document.getElementsByClassName('edizioni');
	if (edizione == 'diplomatica') {
		console.log(dipl);
		 for (i = 0; i < inte.length; i += 1) {
			dipl[i].style.display = 'inline';
			inte[i].style.display = 'none';
		}
		for (i = 0; i < b.length; i += 1) {
			b[i].innerText = "Visualizza l'edizione interpretativa";
		}
		
		edizione = 'interpretativa';
	} else if (edizione == 'interpretativa') {
		for (i = 0; i < inte.length; i += 1) {
			dipl[i].style.display = 'none';
			inte[i].style.display = 'inline';
		}
		for (i = 0; i < b.length; i += 1) {
			b[i].innerText = "Visualizza l'edizione diplomatica";
		}
		
		edizione = 'diplomatica';
	};

}

window.onload = edizioni();