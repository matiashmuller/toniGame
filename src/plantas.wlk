class Maiz {
	var esBebe = true
	var property position
	method regar() {
		esBebe = false
	}
	
	method image() = if(esBebe){"maiz_bebe.png"}else{"maiz_adulto.png"}
	
	method estaListaParaCosechar() = !esBebe
	
	method valor() = 150
}

class Trigo {
	var etapaEvolucion = 0
	var contador=0
	var property position
	method image() {
		var imagen = "trigo_0.png"
		if (etapaEvolucion == 1)
			imagen ="trigo_1.png"
		if (etapaEvolucion == 2)
			imagen ="trigo_2.png"
		if (etapaEvolucion == 3)
			imagen ="trigo_3.png"	
		return imagen
	}
	
	method regar() {
		contador++
		if (contador < 4){
			etapaEvolucion++
		} else {
			etapaEvolucion = 0
			contador = 0
		}
		
		
	}
	
	method estaListaParaCosechar() = etapaEvolucion >= 2
	
	method valor() = if(etapaEvolucion==2){100} else {200}
}


class Tomaco {
	var property image = "tomaco_ok.png"
	var property position
	method regar() {}
	method estaListaParaCosechar() = true
	method valor() = 80
}