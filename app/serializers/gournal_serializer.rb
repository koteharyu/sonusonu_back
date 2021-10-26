class GournalSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image_url, :author_image_url, :processed_created_at

  def processed_created_at
    object.created_at.strftime('%Y/%m/%d %H:%M')
  end
end
