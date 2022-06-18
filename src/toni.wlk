import plantas.*
import wollok.game.*

object toni {
	const plantasSembradas=[]
	const plantasCosechadas=[]
	var property oroRecaudado = 0
	
	const property image = "toni.png"
	var property position = game.at(
		0.randomUpTo(game.width()-1),
		0.randomUpTo(game.height()-1)
	)
	
	// Movimiento
	method arriba() {
		position = position.up(1)
	}
	
	method abajo() {
		position = position.down(1)
	}
	
	method izquierda() {
		position = position.left(1)
	}
	
	method derecha() {
		position = position.right(1)
	}
	
	// Consigna
	
	method sembrar(planta) {
		plantasSembradas.add(planta)
		game.addVisual(planta)
	}
	method regarLasPlantas() {
		plantasSembradas.forEach{ p => p.serRegada() }
	}
	method plantasListasParaCosechar() = plantasSembradas.filter{ p=>p.estaListaParaCosechar()}
	method cosecharTodo() {
		self.plantasListasParaCosechar().forEach{p=>self.cosechar(p)}
	}
	method cosechar(planta) { 
		plantasSembradas.remove(planta)
		plantasCosechadas.add(planta)
		game.removeVisual(planta)
	}
	method venderCosecha() {
		plantasCosechadas.forEach{p=>self.vender(p)}
	}
	method vender(planta) { 
		oroRecaudado += planta.valor()
		plantasCosechadas.remove(planta)
	}
	
	/*
	 * Otra forma de vender cosecha
	 * Para no borrar mientras se itera en el forEach
	 * (recomendada por Gerardo)
	 * 
	 * method venderCosecha(){
	 *   oroRecaudado += self.valorCosecha()}
	 *   plantasCosechadas.clear()
	 * }
	 */
	method paraCuantosDiasLeAlcanza() = ((oroRecaudado + self.valorCosecha())/200).truncate(0)
	method valorCosecha() = plantasCosechadas.sum{p=>p.valor()}
	method cuantoHayParaCeliacos() = self.plantasListasParaCosechar().count{p=>p.esAptaCeliacos()}
	method convieneRegar() = plantasSembradas.any{p=>!p.estaListaParaCosechar()} 
}
