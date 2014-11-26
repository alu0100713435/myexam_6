require 'lib/myexam_6/myexam_6.rb'
require 'lib/myexam_6/myexam_6.1.rb'
require 'lib/myexam_6/myexam_6.2.rb'
require 'spec_helper'

describe SeleccionSimple do

	before :each do
		@p1 = SeleccionSimple.new("Salida del siguiente codigo: \nClass Xyz \n	def pots \n		@nice \n	end \nend", ["#<Xyz:0xa000208>","nil","0", "ninguna de las anteriores"])		
		@p2 = VerdaderoFalso.new("Definicion de un has en Ruby: \nhash_raro = \n	[1, 2, 3] => Object.new(), \n	Hash.new => :toto")	
		@p3 = SeleccionSimple.new("Salida del siguiente codigo: \nClass Array \n	def say_hi \n		HEY! \n	end \nend", ["1","bob","HEY!","ninguna de las anteriores"])
		@p4 = SeleccionSimple.new("Tipo de objeto en: \nclass Objeto \nend", ["Una instancia de la clase","una constante","un objeto","Ninguna de las anteriores"])
		@p5 = VerdaderoFalso.new("Es apropiado que una clase Tablero herede de una clase Juego")

		@node1 = Node.new(@p1,nil)
		@node2 = Node.new(@p2,nil)
		@node3 = Node.new(@p3,nil)
		@node4 = Node.new(@p4,nil)
		@node5 = Node.new(@p5,nil)
		@lista = Lista.new(@node1)
		@lista.push_final(@node2)
		@lista.push_final(@node3)
		@lista.push_final(@node4)
		@lista.push_final(@node5)
	
		@exa = Examen.new(@lista,["a","b","a","a","b"])
		@exa1 = Examen.new(@lista,["b","a","a","b","a"])
	end

	describe "Examen" do

		it "Comprobar clase examen" do
			expect(@exa.class).to eq(Examen)
		end

		it "Mostrar examen" do
			expect(@exa.mostrar(2)).to eq(@lista.mostrar(2))
			expect(@exa.mostrar(2)).to eq(@lista.mostrar(2))
			expect(@exa.mostrar(1)).to_not eq(@lista.mostrar(3))
		end

		it "Interfaz de usuario" do
			expect(@exa.exam).to eq("true")
			expect(@exa1.exam).to eq("false")
		end

		it "Interfaz de usuario invertida" do
			expect(@exa.examInvertido).to eq("false")
			expect(@exa1.examInvertido).to eq("true")
		end


	end
end
