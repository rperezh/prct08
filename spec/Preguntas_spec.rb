
require_relative '../lib/Preguntas'

  describe Pregunta do
 
    before :each do
      @p1 = Pregunta.new("Cuanto es 2 mas dos?", ["4","3","1"], 0)  
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
      @p1.num_c.should be_kind_of(Integer)
    end    

    it "Se debe mostrar por la consola la pregunta y las opciones de respuesta" do
      expect(@p1.respond_to? :to_s)  
    end
  end


