import dependencias.*
import pedidos.*

class Corsa {
	var property color = ""
	
	method capacidad() =  4
	method velocidadMaxima() =  150
	method peso() =  1300
}

class Kwid {
	var property tanqueDeGasExtra = false
	
	method capacidad() { return if (not tanqueDeGasExtra) { 4 } else { 3 } }
	method velocidadMaxima() { return if (tanqueDeGasExtra) { 120 } else { 110 } }
	method peso() { return if (tanqueDeGasExtra) { 1350 } else { 1200 } } 
	method color() = "azul"
}

class Especial {
	var property capacidad = 0
	var property velocidadMaxima = 0
	var property peso = 0
	var property color = ""
}

object trafic {
	var property interior = null
	var property motor = null
	
	method capacidad() = interior.capacidad()
	method velocidadMaxima() = motor.velocidadMaxima()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}
object interiorComodo {
	method capacidad() = 5
	method peso() = 700
}
object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}
object motorPulenta {
	method velocidadMaxima() = 130
	method peso() = 800
}
object motorBataton {
	method velocidadMaxima() = 80
	method peso() = 500
}