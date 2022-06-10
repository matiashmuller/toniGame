import plantas.*

object toni {
	var plantaSembradas = []
	var plantaCosechadas= []
	var monedasDeOro = 0
	
	var property image = "toni.png"
	var property position 
	
	method  cuantaMondedasTengo() = monedasDeOro
	
	method sembrar(unaPlanta) {
		plantaSembradas.add(unaPlanta)
	}
	
	method regarLasPlantas(){
		plantaSembradas.forEach( {
			planta => planta.regar()
		})
	}
	

	
	method plantasListasParaCosechar() {
		return plantaSembradas.filter( { planta => planta.estaListaParaCosechar()})
	}
	
	method cosecharTodo() {
		self.plantasListasParaCosechar().forEach( {
			planta => self.cosecharPlanta(planta)
		})
	}
	
	method cosecharPlanta(unaPlanta) {
		plantaSembradas.remove(unaPlanta)
		plantaCosechadas.add(unaPlanta)
	}
	
	
	method venderCosecha() {
		monedasDeOro += plantaCosechadas.sum( { p => p.valor()})
		plantaCosechadas.clear()
	}
	
	method arriba() {
		position = position.up(1)
	}
	
	method abajo() {
		position = position.down(1)
	}
	
	method derecha() {
		position = position.right(1)
	}
	
	method izquierda() {
		position = position.left(1)
	}
	
}
