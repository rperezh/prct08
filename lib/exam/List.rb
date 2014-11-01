#!/usr/bin/env ruby


Node = Struct.new(:value,:sig,:ant) do

  #Metodo para inicializar la clase
  def initialize (value, sig, ant)
    @value = value
    @sig = sig
    @ant = ant
  end

  #Metodo para mostrar por pantalla un nodo
  def to_s
    if @sig == nil && @ant == nil
      "#{@value}" 
    else 
      "#{@value} <-->" 
    end
  end
  
  #Funcion para obtener el valor de un nodo
  def dev_value
     return @value
  end

  #Funcion para obtener el puntero a siguiente de un nodo
  def dev_sig
    return @sig
  end

  #Funcion para obtener el puntero al anterior de un nodo
  def dev_ant
    return @ant
  end

  def mod_ant(ant)
    @ant = ant
  end

  def mod_sig(sig)
    @sig = sig
  end

end

class List < Node
attr_accessor :head, :tail

  def initialize
     @head = nil
     @tail = nil
  end

  def ins_final(valor)
    if @tail != nil
       @tail = Node.new(valor,nil,@tail)
       n = @tail.dev_ant
       n.mod_sig(@tail)
    else 
      @head = Node.new(valor,nil,nil)
      @tail = @head
    end
  end

  def ins_inicio(valor)
    if @head != nil && @head.sig != nil
      n = @head.sig
      @head = Node.new(valor,n,nil)
      n.mod_ant(@head)
    elsif @head != nil 
      n = @head
      @head = Node.new(valor,n,nil)
      n.mod_ant(@head) 
      @tail = n
    else 
      @head = Node.new(valor,nil,nil)  
      @tail = @head
    end
  end

  def sup_inicio
    n = @head
    @head = @head.dev_sig
    if @head!= nil
       @head.mod_ant(nil)
    end
  end
 
  def sup_final
    n = @tail
    @tail = @tail.dev_ant
    if @tail != nil
      @tail.mod_sig(nil)
    end
  end
  
  #Metodo para representar por pantalla una lista enlazada
  def to_s
    s = "NIL <--> "
    if @head == nil
       s << "NIL"
    elsif @head.dev_sig == nil
       s << "#{@head.to_s} --> NIL"
    else
       while @head.dev_sig != nil 
         s << "#{@head.to_s} "
         @head = @head.dev_sig
       end
       s << "#{@head.to_s}"
       s << " NIL"
    end
    return s
  end
end 

p1 = List.new
p1.ins_inicio(1)
p1.ins_inicio(2)
p1.ins_final(3)
p1.sup_inicio
puts p1    
