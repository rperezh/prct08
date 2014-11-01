Node = Struct.new(:value, :sig) do
  # Metodo para inicializar la clase
  def initialize (value, sig)
    @value = value
    @sig = sig
  end

  # Metodo para mostrar por pantalla un nodo
  def to_s
    if @sig == nil
      "#{@value} " 
    else 
      "#{@value} --> " 
    end
  end
  
  # Funcion para obtener el valor de un nodo
  def dev_value
    return @value
  end

  # Funcion para obtener el puntero a siguiente de un nodo
  def dev_sig
    return @sig
  end

  # Metodo para cambiar el puntero a siguiente de un nodo
  def mod_sig(sig)
    @sig = sig
  end
end

class List
  attr_accessor :head

  # Metodo par inicializar la clase
  def initialize
    @head = nil
  end

  # Metodo para insertar un nodo al principio de la lista
  def ins_inicio(valor)
    @head = Node.new(valor, @head)
  end

  # Metodo para eliminar un nodo del principio de la lista
  def sup_inicio
    @head = @head.dev_sig
  end
 
  # Metodo para insertar un nodo al final de la lista
  def ins_final(valor)
    last = @head
    while last.dev_sig != nil
      last = last.dev_sig
    end
    last.mod_sig(Node.new(valor, nil))
  end

  # Metodo para eliminar un nodo del final de la lista
  def sup_final
    last = @head
    while last.dev_sig != nil
      ant = last
      last = last.dev_sig
    end
    ant.mod_sig(last.dev_sig)
  end
  
  # Metodo para representar por pantalla una lista enlazada
  def to_s
    s = ""
    if @head == nil
       s << "NIL"
    elsif @head.dev_sig == nil
      s << "#{@head.to_s}--> NIL"
    else
      nodo = @head
      while nodo.dev_sig != nil 
        s << "#{nodo.to_s}"
        nodo = nodo.dev_sig
      end
      s << "#{nodo.to_s}"
      s << "--> NIL"
    end
    return s
  end

  # Metodo para obtener el numero de nodos de una lista
  def length 
    if @head == nil
      num = 0
    else
      n = @head
      num = 1
      while n.dev_sig != nil
        num += 1
        n = n.dev_sig
      end
    end
    num
  end
 end 

#p1 = List.new
#puts p1
#p1.ins_inicio(1)
#p1.length
#p1.ins_inicio(2)
#p1.ins_inicio(3)
#p1.ins_inicio(4)
#puts p1
#p1.sup_inicio
#p1.ins_final(5)
#puts p1    
#p1.ins_final(6)
#puts p1
#p1.sup_final
