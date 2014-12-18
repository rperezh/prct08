require 'spec_helper'
require 'Naranjero'

describe Naranjero do
  before :each do
    @n1 = Trabajador.new(Mutex.new, ConditionVariable.new, Naranjero.new)
    @n2 = @n1.recolectar_naranjas
  end

  it "Debe existir un metodo que indique la altura" do
    expect(@n1.naranjero.respond_to? :dev_altura).to eq(true)
  end

  it "Debe existir un metodo que indique su edad" do
    expect(@n1.naranjero.respond_to? :dev_edad).to eq(true)
  end

  it "Debe existir un metodo llamado uno_mas" do
    expect(@n1.naranjero.respond_to? :uno_mas).to eq(true)
  end

  it "Debe existir un metodo llamado recolectar_una" do
    expect(@n1.naranjero.respond_to? :recolectar_una).to eq(true)
  end

  it "El arbol debe morir cuando tenga 10 de edad" do
    expect(Naranjero::EDAD_MUERTE == 10).to eq(true)
  end

  it "El arbol debe empezar a producir cuando tenga 3 de edad" do
    expect(Naranjero::EDAD_COMIENZO_PRODUCCION == 3).to eq(true)
  end
  
end
