class DetalleReservacionsController < ApplicationController
  def new_or_edit
    @reservacion = Reservacion.find(params[:id])
    #@detalle_reservacion = @reservacion.detalle_reservacions if @reservacion
    @detalle_reservacion ||= DetalleReservacion.new if @reservacion
  end

  def save
    @reservacion = Reservacion.find(params[:id])
    @fecha_inicial = Date.civil(params[:detalle_reservacion][:"fecha_inicial(1i)"].to_i,params[:detalle_reservacion][:"fecha_inicial(2i)"].to_i,params[:detalle_reservacion][:"fecha_inicial(3i)"].to_i)
    @fecha_final = Date.civil(params[:detalle_reservacion][:"fecha_final(1i)"].to_i,params[:detalle_reservacion][:"fecha_final(2i)"].to_i,params[:detalle_reservacion][:"fecha_final(3i)"].to_i)
    @detalle_reservacion = DetalleReservacion.new(params[:detalle_reservacion])
    @detalle_reservacion.fecha_inicial = @fecha_inicial
    @detalle_reservacion.fecha_final = @fecha_final
    @detalle_reservacion.reservacion_id = @reservacion if @reservacion
   
    
    #### verificamos si no existe ya un registro en esa misma fecha ###
    @busy = DetalleReservacion.find(:all, :conditions => ["habitacion_id = ? AND ((? between fecha_inicial AND fecha_final) OR (? between fecha_inicial AND fecha_final))", @detalle_reservacion.habitacion_id, @detalle_reservacion.fecha_inicial, @detalle_reservacion.fecha_final])
    unless @busy.empty?
      flash[:notice] = "Reserve otra habitación u otra fecha porque ya se encuentra ocupada"
      render :action => "new_or_edit", :id => @reservacion
    else
      if @detalle_reservacion.save
        flash[:notice] = "Habitación guardada correctamente"
        redirect_to :action => "list", :id => @reservacion
      end
    end
  end

  def list
    @reservacion = Reservacion.find(params[:id])
    @detalles = @reservacion.detalle_reservacions
  end

  def show
    @detalle_reservacion = DetalleReservacion.find(params[:id])
  end

  def destroy
    @detalle_reservacion = DetalleReservacion.find(params[:id])
    @reservacion = @detalle_reservacion.reservacion_id
    if @detalle_reservacion.destroy
      flash[:notice] = "Habitación eliminada correctamente"
      redirect_to :action => "list", :id => @reservacion
    end
  end

end
