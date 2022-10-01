import especies.*

object reserva {
	const habitats = []
	
	method agregarHabitat(habitat) {
		return habitats.add(habitat)
	}
	
	method quitarHabitat(habitat) {
		return habitats.remove(habitat)
	}
	
	method mayorBiomasa() {
		return habitats.max({
			g => g.totalBiomasa()
		})
	}
	
	method cantidadTotalBiomasa() {
		return habitats.sum({
			g => g.totalBiomasa()
		})
	}
	
	method habitatsDesequilibrados() {
		return habitats.filter({
			g => !g.habitatEquilibrado()
		})
	}
	
	method habitatsEquilibrados() {
		return habitats.filter({
			g => g.habitatEquilibrado()
		})
	}
		
	method especieEstaEnTodosLosHabitats(especie) {
		return habitats.all({
			g => g.contieneEspecie(especie)
		})
	}
}

class Habitat {
	const property seresVivos = []
	
	method agregarSerVivo(serVivo) {
		return seresVivos.add(serVivo)
	}
	
	method quitarSerVivo(serVivo) {
		return seresVivos.remove(serVivo)
	}
	
	method totalBiomasa() {
		return seresVivos.sum({
			g => g.biomasa()
		})
	}
	
	method habitatEquilibrado() {
		return self.cantidadGrandes() < (self.cantidadPequenios() / 3) and self.hayMedianos()
	}
	
	method cantidadGrandes() {
		return seresVivos.count({
			g => g.esGrande()
		})
	}
	
	method cantidadPequenios() {
		return seresVivos.count({
				g => g.esPequenio()
		})
	}
	
	method hayMedianos() {
		return seresVivos.any({
				g => g.esMediano()
		})
	}
	
	method producirIncendio() = seresVivos.forEach({g => g.consecuenciaDelIncendio() self.limpiezaDeHabitat()}) 
	
	method limpiezaDeHabitat() {
		return seresVivos.forEach({
			g => self.eliminar(g)
		})
	}
	
	method eliminar(serVivo) {
		if (not serVivo.estaVivo()) {
			seresVivos.remove(serVivo)
		}
	}
	
	method contieneEspecie(especie) {
		return seresVivos.contains(especie)
	}
}