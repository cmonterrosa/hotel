class ReservacionesController < ApplicationController
  def index
  
  end

  def calendario
     @reservacion = Reservacion.new
     #@sesiones = Sesion.find(:all, :select=> ["s.*"], :joins => "s, horarios h", :conditions => ["s.horario_id=h.id"], :order => "s.fecha, h.hora,h.minutos")
     @date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
     @title = "Reservaciones"
  end

  

  def resumen_habitaciones
    if params[:year] =~ /^\d{4}$/ && params[:month] =~ /^\d{1,2}$/ && params[:day] =~ /^\d{1,2}$/
       @fecha = DateTime.parse("#{params[:year]}-#{params[:month]}-#{params[:day]}")
       @before = @fecha.yesterday
       @after = @fecha.tomorrow
       #@salas = Sala.find(:all, :order => "descripcion")
       #@horarios = Horario.find(:all, :group => "hora,minutos")
       @habitaciones = Habitacion.find(:all)
    else
      flash[:notice] = "Error"
      redirect_to :action => "home"
    end
  end

end
