require 'spec_helper'
require 'exam'
require 'List'
require 'Quiz'

describe Quiz do
  before :each do
    @l1 = List.new
    @l1.ins_inicio(Exam::Pregunta.new('¿Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots', ['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1, 0))
    @l1.ins_final(Exam::Pregunta.new('La siguiente definicion de un hash en Ruby es validad: hash_raro = { [1, 2, 3] => Object.new(), Hash.new => :toto }', ['Cierto', 'Falso'], 0, 1))
    @l1.ins_final(Exam::Pregunta.new('Cual es la salida del siguiente codigo Ruby? class Array def say_hi "HEY!" end end p [1, "bob"].say_hi', ['1', 'bob', 'HEY!', 'Ninguna de las anteriores'], 2, 2))
    @l1.ins_final(Exam::Pregunta.new('Cual es el tipo del objeto en el siguiente codigo Ruby? class Objeto end', ['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'], 0, 3))
    @l1.ins_final(Exam::Pregunta_VF.new('Es apropiado que una clase Tablero herede de una clase Juego', 0, 4))
    @l1.ins_final(Exam::Pregunta.new('¿Cual es la salida del siguiente codigo Ruby? class Xyz def pots @nice end end xyz = Xyz.new p xyz.pots', ['#<Xyz:0xa000208>', 'nil', '0', 'Ninguna de las anteriores'], 1, 1))
    @q1 = InterfazQuiz.new("Examen LPP", @l1)
  end

  it "Se debe poder realizar por pantalla un examen" do
    expect(@q1.respond_to? :run)
  end

  it "Se debe poder mostrar por pantalla un examen" do
    expect(@q1.respond_to? :to_s)
  end
  
  it "Se debe poder corregir un examen" do
    expect(@q1.respond_to? :check)
  end

  it "Debe existir alguna pregunta en el examen" do
    expect(@q1.questions.count >= 1).to eq(true)
  end

  it "Comprobar que no hay preguntas iguales" do
    p1 = @q1.questions.head
    while p1.dev_sig != nil
      p2 = p1.dev_sig
      while p2 != nil
        expect(p1.dev_value == p2.dev_value).to eq(false)
        p2 = p2.dev_sig
      end
      p1 = p1.dev_sig
    end
  end
  
  it "Examen perfecto" do
    expect(@q1.check([1, 0, 2, 0, 0, 1])).to eq(6)
  end
  
  it "Examen aprobado" do
    expect(@q1.check([1, 0, 2, 1, 1, 0])).to be >= 3
  end
  
  it "Examen suspenso" do
    expect(@q1.check([1, 1, 2, 1, 1, 0])).to be < 3
  end

  it "Deben existir opciones de respuestas" do
    p = @q1.questions.head
    while p.dev_sig != nil
      expect(p.dev_value.answers).not_to be_empty
      p = p.dev_sig
    end
  end

  it "Se debe invocar a un metodo para obtener la pregunta" do
    p = @q1.questions.head
    while p.dev_sig != nil
      expect(p.dev_value.respond_to? :obtener_pregunta)
      p = p.dev_sig
    end
  end

  it "Se debe invocar a un metodo para obtener las opciones de respuesta" do
    p = @q1.questions.head
    while p.dev_sig != nil
      expect(p.dev_value.respond_to? :obtener_respuestas)
      p = p.dev_sig
    end
  end
        
  it "Debe existir al menos una respuesta correcta" do
    p = @q1.questions.head
    while p.dev_sig != nil
      expect(p.dev_value.num_c != nil)
      p = p.dev_sig
    end
  end    

  it "Se debe mostrar por la consola la pregunta y las opciones de respuesta" do
    p = @q1.questions.head
    while p.dev_sig != nil
      expect(p.dev_value.respond_to? :to_s)  
      p = p.dev_sig
    end
  end
  
  it "Comprueba el numero de preguntas en el examen" do
    expect(@q1.questions.count).to eq(6)
  end

  it "Comprueba que una pregunta es de menor nivel que otra" do
    expect(@q1.questions.head.dev_value < @q1.questions.head.dev_sig.dev_value).to eq(true)
    expect(@q1.questions.head.dev_sig.dev_value < @q1.questions.head.dev_value).to eq(false)
  end 
end
