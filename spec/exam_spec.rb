require 'spec_helper'
require 'exam'

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
