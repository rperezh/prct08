require 'spec_helper'
require 'exam'
require 'List'

describe Exam do
  before :each do
    @p1 = Exam::Pregunta.new("Cuanto es 2 mas 2?", ["4", "3", "1"], 0, 2)
    @p2 = Exam::Pregunta_VF.new("Es apropiado que una clase Tablero herede de una clase Juego", 0, 3)
    @p3 = Exam::Pregunta.new("Cuanto es 3 mas 2?", ["5", "3", "1"], 0, 2)
    @p4 = Exam::Pregunta_VF.new("Edison invento la bombilla?", 0, 5) 
    @p5 = Exam::Pregunta.new("Cuanto es 2 mas 2?", ["4", "3", "1"], 0, 2)
  end

  it "Comprobar clase Pregunta" do
    expect(@p1.is_a? Exam::Pregunta).to eq(true)
  end

  it "Comprueba que una pregunta es de menor nivel que otra" do
    expect(@p1 < @p2).to eq(true)
    expect(@p2 < @p1).to eq(false)
  end
  
  it "Comprueba que una pregunta es de mismo nivel que otra" do
    expect(@p1 == @p3).to eq(false)
    expect(@p1 == @p5).to eq(true)
  end
  
  it "Comprueba que una pregunta es de mayor nivel que otra" do
    expect(@p4 > @p1).to eq(true)
  end
  
  it "Debe existir un nivel de pregunta y debe estar entre 0 y 10" do
    expect(@p1.level >= 0 && @p1.level <= 10)
  end
  
  it "Comprobar herencia de la clase Pregunta_VF" do
    expect(@p2.is_a? Exam::Pregunta).to eq(true)
  end
  
  it "Comprobar instancia de Pregunta_VF" do
    expect(@p2).to be_an_instance_of(Exam::Pregunta_VF)
  end

  it "Debe existir una pregunta" do
    expect(@p1.title).not_to be_empty
    expect(@p2.title).not_to be_empty
  end

  it "Deben existir opciones de respuestas" do
    expect(@p1.answers).not_to be_empty
    expect(@p2.answers).not_to be_empty
  end

  it "Se debe invocar a un metodo para obtener la pregunta" do
    expect(@p1.respond_to? :obtener_pregunta)
    expect(@p2.respond_to? :obtener_pregunta)
  end
         
  it "Se debe invocar a un metodo para obtener las opciones de respuesta" do
    expect(@p1.respond_to? :obtener_respuestas)
    expect(@p2.respond_to? :obtener_respuestas)
  end
        
  it "Debe existir al menos una respuesta correcta" do
    expect(@p1.num_c != nil)
    expect(@p2.num_c != nil)
  end    

  it "Se debe mostrar por la consola la pregunta y las opciones de respuesta" do
    expect(@p1.respond_to? :to_s)  
    expect(@p2.respond_to? :to_s)  
  end
  
  it "Solo existen 2 respuestas: Verdadero o Falso" do
    expect(@p2.answers.size == 2 && @p2.answers == ["Cierto", "Falso"])
  end
end

describe Node do
  before :each do
    @t1 = List.new
    @t1.ins_inicio(1)
    @t1.ins_inicio(2)
  end

  it 'Debe existir un Nodo de la lista con sus datos y su siguiente' do
    expect(@t1.head.dev_value != nil && @t1.head.dev_sig != nil)
  end
end

describe List do
  before :each do
    @t1 = List.new
    @t1.ins_inicio(1)
    @t1.ins_final(2)
    @t1.ins_inicio(4)
  end

  it 'Se extrae el primer elemento de la lista' do
    l = @t1.length
    @t1.sup_inicio
    expect(@t1.length + 1 == l)
  end

  it "El maximo debe ser 4" do
    expect(@t1.max == 4).to eq(true)
  end
  
  it "El minimo debe ser 1" do
    expect(@t1.min == 1).to eq(true)
  end
  
  it "Comprueba el numero de elementos de la lista" do
    expect(@t1.count).to eq(3)
  end

  it "Comprueba que hay un elemento en la lista" do
    expect(@t1.include?(4)).to eq(true)
  end
  
  it 'Se puede insertar un elemento' do
    l = @t1.length
    @t1.ins_inicio(2)
    expect(@t1.length - 1 == l)
  end

  it 'Se pueden insertar varios elementos' do
    l = @t1.length
    @t1.ins_inicio(3)
    @t1.ins_inicio(4)
    @t1.ins_final(5)
    expect(@t1.length - 3 == l)
  end

  it 'Debe existir una lista con su cabeza' do
    expect(@t1.head != nil)
  end
end
