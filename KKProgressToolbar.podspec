Pod::Spec.new do |s|
  s.name                      = 'KKProgressToolbar'
  s.module_name               = 'KKProgressToolbar'
  s.version                   = '3.0.2'
  s.summary                   = 'KKProgressToolbar is an iOS drop-in class that displays a translucent UIToolbar with a progress indicator'
  s.homepage                  = 'https://github.com/aporat/KKProgressToolbar'
  s.license                   = 'MIT'
  s.author                    = { 'Adar Porat' => 'http://github.com/aporat' }
  s.platform                  = :ios, '12.0'
  s.ios.deployment_target     = '12.0'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/aporat/KKProgressToolbar.git', :tag => s.version.to_s }
  s.source_files              = 'KKProgressToolbar/*.{swift}'
  s.swift_version             = '5.2'
  s.dependency 'GTProgressBar', "~> 0.3"
  s.dependency 'SnapKit', "~> 5.0"
  
end
