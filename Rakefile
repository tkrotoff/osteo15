require "jekyll"

desc "Build using 'jekyll build'"
task :build, :env do |t, args|
  config = {}
  if (args[:env] == 'production')
    config[:minify_html] = true
    config[:sass] = {style: :compressed}
  else
    config[:minify_html] = false
    config[:sass] = {style: :expanded}
  end
  config[:full_rebuild] = true
  p "Pre-configuration: #{config}"
  config = Jekyll.configuration(config) # Reads config.yml file
  site = Jekyll::Site.new(config)
  site.process # Builds the Jekyll site
end

require "html/proofer"

desc "Validate _site using HTML::Proofer"
task :htmlproof do
  HTML::Proofer.new("./_site", {check_favicon: true, check_html: false, verbose: false}).run
end

desc "Validate _site using validate-website"
task 'validate-website' do
  Dir.chdir('./_site') do
    system("bundle exec validate-website-static --site 'https://osteo15.com' --verbose --markup --not-found") do |ok, res|
      unless ok
        puts "validate error (status = #{res.exitstatus})"
      end
    end
  end
end

desc "Validate _site using The Nu HTML Checker (v.Nu) - installation: `brew install vnu`"
task :vnu do
  system("vnu --skip-non-html _site")
end

desc "Validate _site using all available tools"
task test: [:vnu, 'validate-website', :htmlproof]

desc "Deploy on Amazon S3 using s3_website"
task :deploy do
  task(:build).invoke('production')
  system "bundle exec s3_website push"
end
