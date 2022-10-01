class EspecieFauna {
	const property pesoReferencia
	const property locomocion
	const property coeficiente
}

class EspecieFlora {
	const property alturaReferencia
}

class Animal {
	var property peso
	const property especieFauna
	var property estaVivo = true
	
	method biomasa() = (peso * peso) / especieFauna.coeficiente()
	
	method esPequenio() {return peso < especieFauna.pesoReferencia() / 2}
	
	method esGrande() {return peso > especieFauna.pesoReferencia() * 2}
	
	method esMediano() {return not self.esPequenio() and not self.esGrande()}
	
	method consecuenciaDelIncendio() {
		if (especieFauna.locomocion().seSalva(self)) {
			peso = peso * 0.9
		} else {
			estaVivo = false
		}
	} 
}

class Planta {
	var property altura
	const property especieFlora
	var property estaVivo = true
	
	method biomasa() = 10.min(2 * altura)
	
	method esGrande() {return altura >= 10}
	
	method esPequenio() {return altura < 10}
	
	method esMediano() = false
	
	method consecuenciaDelIncendio() {
		if (self.esPequenio()) {
			estaVivo = false
		} else {
			altura -= 5
		}
	}
}

object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(animal) = true}
object correr {method seSalva(animal) = animal.esMediano()}
object inmobil {method seSalva(animal) = false}