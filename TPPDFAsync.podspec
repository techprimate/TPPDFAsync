Pod::Spec.new do |s|
  s.name             = 'TPPDFAsync'
  s.version          = '0.0.1'
  s.summary          = 'TPPDFAsync adds asynchronous capabilities to TPPDF'
  s.description      = <<-DESC
    TPPDF is an object-based PDF builder, completely built in Swift.
    TPPDFAsync adds wrappers for asynchronous tasks.
                       DESC

  s.homepage         = 'https://github.com/techprimate/TPPDFAsync'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Philip Niedertscheider' => 'dev@philpri.me' }
  s.source           = { :git => 'https://github.com/techprimate/TPPDFAsync.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/techprimate'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/**/*'
  s.framework = "Combine"
  s.dependency 'TPPDF'
  s.swift_version = '5.2'

end
