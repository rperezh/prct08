require 'spec_helper'
require 'exam'
require 'List'

describe Exam do
  before :each do
    @p1 = Exam::Pregunta.new("Cuanto es 2 mas 2?", ["4", "3", "1"], 0)
  end

  it "Debe existir una pregunta" do
    expect(@p1.title).not_to be_empty
  end

  it "Deben existir opciones de respuestas" do
    expect(@p1.answers).not_to be_empty
  end

  it "Se debe invocar a un metodo para obtener la pregunta" do
    expect(@p1.respond_to? :obtener_pregunta)
  end
         
  it "Se debe invocar a un metodo para obtener las opciones de respuesta" do
    expect(@p1.respond_to? :obtener_respuestas)
  end
        
  it "Debe existir al menos una respuesta correcta" do
    expect(@p1.num_c != nil)
  end    

  it "Se debe mostrar por la consola la pregunta y las opciones de respuesta" do
    expect(@p1.respond_to? :to_s)  
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
  end

  it 'Se extrae el primer elemento de la lista' do
    l = @t1.length
    @t1.sup_inicio
    expect(@t1.length + 1 == l)
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
