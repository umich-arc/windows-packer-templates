Racker::Processor.register_template do |t|
  t.postprocessors['manifest'] = {
    'type'        => 'manifest',
    'output'      => 'manifest.json',
    'strip_path'  => false
  }
end
