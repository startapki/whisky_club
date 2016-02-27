class ItemImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :postgresql_lo

  def url
    "/images/#{oid}"
  end

  process convert: 'png'

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def oid
    storage.instance_variable_get(:@oid)
  end
end
