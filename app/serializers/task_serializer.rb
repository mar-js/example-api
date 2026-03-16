class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :done, :status

  def status
    object.done ? "Completada" : "Pendiente"
  end
end
