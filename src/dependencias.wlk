import rodados.*
import pedidos.*

class Dependencia {
const property flota = []
var property empleados = 40
const property pedidos = []
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	
	method pesoTotalFlota() = flota.sum{r => r.peso()} 
	
	method estaBienEquipada() { return self.velocidadMaxima100() and flota.size() > 3 }
	
	method velocidadMaxima100() = flota.all{r => r.velocidadMaxima() >= 100}
	
	method capacidadTotalEnColor(color) { return self.rodadoEnColor(color).sum{r => r.capacidad()} }
	
	method rodadoEnColor(color) = flota.filter{r => r.color() == color}
	
	method colorDelRodadoMasRapido() = flota.max{r => r.velocidadMaxima()}.color()
	
	method capacidadFaltante() = 0.max(empleados - self.capacidadTotal())
	
	method capacidadTotal() = flota.sum{r => r.capacidad()}
	
	method esGrande() = empleados >= 40 and flota.size() >= 5  	
	
	method agregarAPedidos(pedido) { pedidos.add(pedido) }
	
	method quitarDePedidos(pedido) { pedidos.remove(pedido) }
	
	method totalPasajeros() = pedidos.sum{p => p.pasajeros()}
	
	method noPuedenSerSatisfechos() { return pedidos.filter{r => not self.puedeSerSatisfecho(r)} }
	
	method puedeSerSatisfecho(pedido) { return flota.any{r => pedido.puedeSatisfacerUnPedido(r)} }
	
	method colorIncompatibleEnPedidos(color) { return pedidos.all{p => p.satisfaceElColor(color)} }
	
	method relajarTodosLosPedidos() { pedidos.forEach{r => r.relajar()} }
	
	method totalTiempoMaximo() = pedidos.sum{p => p.tiempo()}	
}