class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :done, :status
  belongs_to :user

  def status
    object.done ? "Completada" : "Pendiente"
  end
end
