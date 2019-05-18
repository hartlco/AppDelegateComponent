Pod::Spec.new do |s|
  s.name             = 'AppDelegateComponent'
  s.version          = '1.0.1'
  s.summary          = 'Split functionality in AppDelegate into smaller components'
  s.description      = 'Provides a easy way to split functionality used in AppDelegate callbacks into small components'

  s.homepage         = 'https://github.com/hartlco/AppDelegateComponent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hartlco' => 'martin@hartl.co' }
  s.source           = { :git => 'https://github.com/hartlco/AppDelegateComponent.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hartlco'

  s.ios.deployment_target = '8.0'
  s.source_files = 'AppDelegateComponent/Classes/**/*'
  s.swift_versions = '5.0'
end
