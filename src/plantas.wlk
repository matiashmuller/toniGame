class Planta {
	var property position
	
	method image()
	method serRegada() // Obligo a implementar en las subclases
	method estaListaParaCosechar()
	method valor()
	method esAptaCeliacos() = true
}

class Maiz inherits Planta{
	var esBebe = true
	
	override method image() = if(esBebe)"maiz_bebe.png" else "maiz_adulto.png"
	
	override method serRegada() { esBebe = false }
	override method estaListaParaCosechar() = !esBebe
	override method valor() = 150
}

class Trigo inherits Planta{
	var etapaEvolucion= 0
	var cantRiegos = 0
	
	override method image() = "trigo_"+etapaEvolucion+".png"
	
	override method serRegada() {
		cantRiegos++
		etapaEvolucion = cantRiegos % 4 // usar uno menos del límite pedido
	}
	override method estaListaParaCosechar() = etapaEvolucion>=2
	override method valor() = 
		if(etapaEvolucion==2) 100 
		else if (etapaEvolucion==3) 200
		else 0	
	override method esAptaCeliacos() = false
}

class Tomaco inherits Planta {
	
	override method image() = "tomaco_ok.png"
	
	override method serRegada() {}
	override method estaListaParaCosechar() = true
	override method valor() = 80
}