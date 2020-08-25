Pod::Spec.new do |s|
  s.name                      = 'KKProgressToolbar'
  s.module_name               = 'KKProgressToolbar'
  s.version                   = '3.0.0'
  s.summary                   = 'KKProgressToolbar is an iOS drop-in class that displays a translucent UIToolbar with a progress indicator'
  s.homepage                  = 'https://github.com/aporat/KKProgressToolbar'
  s.license                   = 'MIT'
  s.author                    = { 'Adar Porat' => 'http://github.com/aporat' }
  s.platform                  = :ios, '12.0'
  s.ios.deployment_target     = '12.0'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/aporat/KKProgressToolbar.git', :tag => s.version.to_s }
  s.source_files              = 'KKProgressToolbar/*.{swift}'
  s.swift_version             = '5.0'
  s.dependency 'GTProgressBar'
  s.dependency 'SnapKit'

end
