import rodados.*
import dependencias.*

class Pedido {
var property distancia = 0
var property tiempo = 0
var property pasajeros = 0
const property coloresIncompatibles = []
	
	method velocidadRequerida() = distancia / tiempo
	method puedeSatisfacerUnPedido(auto) {
		return auto.velocidadMaxima() - self.velocidadRequerida() >= 10
		and auto.capacidad() >= pasajeros
		and not coloresIncompatibles.any{a => a == auto.color()}
	}
	method acelerar() { tiempo = 1.max(tiempo-1) }
	method relajar() { tiempo += 1 }

}