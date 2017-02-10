Pod::Spec.new do |s|

  s.name        = "Ruler"
  s.version     = "1.0.1"
  s.summary     = "Size matters, you need a ruler."

  s.description = <<-DESC
                   In some cases, we need to distinguish between different devices
                   to set UI, but Adaptive Layout can not do that. So, there is a Ruler.
                   DESC

  s.homepage    = "https://github.com/nixzhu/Ruler"

  s.license     = { :type => "MIT", :file => "LICENSE" }

  s.authors           = { "nixzhu" => "zhuhongxu@gmail.com" }
  s.social_media_url  = "https://twitter.com/nixzhu"

  s.ios.deployment_target   = "8.0"

  s.source          = { :git => "https://github.com/nixzhu/Ruler.git", :tag => s.version }
  s.source_files    = "Ruler/*.swift"
  s.requires_arc    = true

end
