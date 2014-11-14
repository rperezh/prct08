require 'spec_helper'
require 'exam'
require 'List'

describe Exam do
  before :each do
    @l1 = List.new
    @l1.ins_inicio(Exam::Pregunta.new('¿Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots',['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1, 1))
    @l1.ins_final(Exam::Pregunta.new('La siguiente definicion de un hash en Ruby es validad: hash_raro = { [1, 2, 3] => Object.new(), Hash.new => :toto }',['Cierto', 'Falso'], 0, 2))
    @l1.ins_final(Exam::Pregunta.new('¿Cual es la salida del siguiente codigo Ruby? class Array def say_hi "HEY!" end end p [1, "bob"].say_hi',['1', 'bob', 'HEY!', 'Ninguna de las anteriores'], 2, 3))
    @l1.ins_final(Exam::Pregunta.new('¿Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto end',['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'], 0, 1))
    @l1.ins_final(Exam::Pregunta_VF.new('Es apropiado que una clase Tablero herede de una clase Juego', 0, 2))
    @l1.ins_final(Exam::Pregunta.new('¿Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots',['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1, 1))
  end

  it "Debe existir una pregunta" do
    p = @l1.head
    while p.dev_sig != nil
      expect(p.dev_value.title).not_to be_empty
      p = p.dev_sig
    end
  end

  it "Deben existir opciones de respuestas" do
    p = @l1.head
    while p.dev_sig != nil
      expect(p.dev_value.answers).not_to be_empty
      p = p.dev_sig
    end
  end

  it "Se debe invocar a un metodo para obtener la pregunta" do
    p = @l1.head
    while p.dev_sig != nil
      expect(p.dev_value.respond_to? :obtener_pregunta)
      p = p.dev_sig
    end
  end
         
  it "Se debe invocar a un metodo para obtener las opciones de respuesta" do
    p = @l1.head
    while p.dev_sig != nil
      expect(p.dev_value.respond_to? :obtener_respuestas)
      p = p.dev_sig
    end
  end
        
  it "Debe existir al menos una respuesta correcta" do
    p = @l1.head
    while p.dev_sig != nil
      expect(p.dev_value.num_c != nil)
      p = p.dev_sig
    end
  end    

  it "Se debe mostrar por la consola la pregunta y las opciones de respuesta" do
    p = @l1.head
    while p.dev_sig != nil
      expect(p.dev_value.respond_to? :to_s)  
      p = p.dev_sig
    end
  end
  
  it "Comprueba el numero de elementos de la lista" do
    expect(@l1.count).to eq(6)
  end
end
