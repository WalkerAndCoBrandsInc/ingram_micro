require 'fabrication'

Fabrication.configure do |fconfig|
  fconfig.fabricator_path = 'fabricators'
  fconfig.path_prefix = Dir.pwd + '/spec'
  fconfig.sequence_start = 10000
end
