Pod::Spec.new do |s|
  s.name     = 'KKProgressToolbar'
  s.version  = '1.0.0'
  s.license  = 'Apache 2.0'
  s.summary  = 'SocialAccounts is an iOS framework that provides an easy way to manage social network accounts'
  s.homepage = 'https://github.com/aporat/KKProgressToolbar.git'
  s.author   = { 'Adar Porat' => 'adar.porat@gmail.com' }
  s.source   = { :git => 'https://github.com/aporat/KKProgressToolbar.git' }
  s.platform = :ios
  
  s.source_files = 'KKProgressToolbar'

  s.ios.deployment_target = '5.0'
  
  s.requires_arc = true

end
