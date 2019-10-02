import rodados.*
import pedidos.*

class Dependencia {
const property flota = []
var property empleados = 40
const property pedidos = []
	
	method agregarAFlota(rodado) = flota.add(rodado)
	method quitarDeFlota(rodado) = flota.remove(rodado)
	method pesoTotalFlota() { return flota.map{r => r.peso()}.sum() }
	method estaBienEquipada() { return self.velocidadMaxima100() and flota.size() > 3 }
	method velocidadMaxima100() = flota.all{r => r.velocidadMaxima() >= 100}
	method capacidadTotalEnColor(color) { return self.rodadoEnColor(color).sum{r => r.capacidad()} }
	method rodadoEnColor(color) = flota.filter{r => r.color() == color}
	method colorDelRodadoMasRapido() = flota.max{r => r.velocidadMaxima()}.color()
	method capacidadFaltante() = 0.max(empleados - self.capacidadTotal())
	method capacidadTotal() = flota.map{r => r.capacidad()}.sum()
	method esGrande() = empleados >= 40 and flota.size() >= 5  	
	method agregarAPedidos(rodado) = pedidos.add(rodado)
	method quitarDePedidos(rodado) = pedidos.remove(rodado)
	method totalPasajeros() = pedidos.map{r => r.capacidad()}.sum()
	method noPuedenSerSatisfechos() { return pedidos.filter{r => not self.puedeSerSatisfecho(r)} }
	method puedeSerSatisfecho(pedido) { return flota.any{r => pedido.puedeSatisfacerUnPedido(r)} }
	method colorIncompatibleEnPedidos(color) { return pedidos.all{r => r.colorIncompatible() == color} }	
}