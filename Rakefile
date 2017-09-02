require "jekyll"

# See task.comment and friends are nil https://github.com/ruby/rake/issues/31
Rake::TaskManager.record_task_metadata = true

desc "Build _site using 'jekyll build'"
task :build, :env do |t, args|
  puts t.comment

  config = {}
  if (args[:env] == 'production')
    # Very very slow => 12 minutes instead of 2s
    #config[:minify_html] = true
    config[:sass] = {style: :compressed}
  else
    config[:minify_html] = false
    config[:sass] = {style: :expanded}
  end
  config[:full_rebuild] = true
  puts "Pre-configuration: #{config}"
  config = Jekyll.configuration(config) # Reads config.yml file
  site = Jekyll::Site.new(config)
  site.process # Builds the Jekyll site
end

require "html-proofer"

desc "Validate _site using HTML::Proofer"
task :htmlproof do |t|
  puts t.comment

  begin
    HTML::Proofer.new("./_site", {check_favicon: true, check_html: false, verbose: false}).run
  rescue => e
    #puts e.message
    #puts e.backtrace
  end
end

desc "Validate _site using validate-website-static"
task 'validate-website-static' do |t|
  puts t.comment

  Dir.chdir './_site' do
    system "bundle exec validate-website-static --site 'https://osteo15.com' --verbose --markup --not-found" do |ok, res|
      unless ok
        puts "validate error (status = #{res.exitstatus})"
      end
    end
  end
end

desc "Validate osteo15.com using validate-website"
task 'validate-website' do |t|
  puts t.comment

  system "bundle exec validate-website --site 'https://osteo15.com' --verbose --markup --not-found"
end

desc "Validate _site using The Nu HTML Checker (v.Nu - https://github.com/validator/validator) - installation: `brew install vnu`"
task :vnu do |t|
  puts t.comment

  system "vnu --skip-non-html _site"
end

desc "Validate osteo15.com using site_validator"
task :site_validator do |t|
  puts t.comment

  report_file = File.join(Dir.tmpdir, 'site_validator-report.html')

  system "bundle exec site_validator https://osteo15.com #{report_file}"
  system "open #{report_file}"
end

desc "Validate local website"
task 'test-local' => [:checkstyle, :htmlproof, 'validate-website-static', :vnu]

desc "Validate osteo15.com"
task 'test-osteo15.com' => ['validate-website', :site_validator]

desc "Deploy on Amazon S3 using s3_website"
task :deploy do |t|
  puts t.comment

  task(:build).invoke('production')
  system "bundle exec s3_website push"
end



desc "Check style"
task :checkstyle do |t|
  puts t.comment

  root = '.'
  subdirs = %w[_includes _layouts _posts _sass assets css]

  all = find_files(root, subdirs, '.env,.gitignore,html,md,yml,xml,Gemfile,json,Rakefile,txt')
  html_md = find_files(root, subdirs, 'html,md', 'README.md')
  md = find_files(root, subdirs, 'md', 'README.md')

  filenames = find_files(root, subdirs, '')
  filenames.each do |file|
    check_filename(file)
  end

  result = true
  result &&= check(/\t/, all, 'tab instead of space')
  result &&= check(/\r\n/, all, 'Windows line separator')
  result &&= check(/ +$/, all, 'trailing space')
  result &&= check('’', html_md, "’ => '")
  result &&= check('“', html_md, '“ => "')
  result &&= check('”', html_md, '” => "')
  result &&= check('«', html_md, '« => "', ['2016-06-23-Notre-part-animale.md'])
  result &&= check('»', html_md, '» => "', ['2016-06-23-Notre-part-animale.md'])
  result &&= check('…', html_md, '… => ...')
  result &&= check(/\w[\s]{2,}\w/, html_md, 'multiple spaces instead of 1')
  result &&= check(/,[.][.][.]/, html_md, ',... => ...')
  result &&= check(/, [.][.][.]/, html_md, ', ... => ...')
  result &&= check(' etc.', html_md, ' etc. => ...')
  result &&= check(/\w ,\w/, html_md, 'bonjour , => bonjour,')
  result &&= check(/(?![^\[]*\])\w;/, md, 'bonjour; => bonjour ;', ['blogger-redirections.md'])
  result &&= check(/(?![^\[]*\]);\w/, md, ';bonjour => ; bonjour')
  result &&= check(' PhD', html_md, ' PhD')
  result &&= check(' MSc', html_md, ' MSc')
  result &&= check(/##+\w/, md, '##bonjour => ## bonjour')
  result &&= check(/\w##+/, md, 'bonjour## => bonjour ##')
  result &&= check(/\w ##+/, md, 'bonjour ## => bonjour')
  result &&= check(/(?![^\(]*\))android/, md, 'android => Android')
  result &&= check('iphone', md, 'iphone => iPhone')
  result &&= check('{%"', md, '{%" => {% "')
  result &&= check('"%}', md, '"%} => " %}')
  result &&= check('href= "', html_md, 'href= " => href="')
  result &&= check('alt= "', html_md, 'alt= " => alt="')
  result &&= check('src= "', html_md, 'src= " => src="')
  result &&= check('caption= "', html_md, 'caption= " => caption="')
  result &&= check(/\[[^\^\]]+\] \(/, md, '] ( => ](')
  result &&= check(/\S\[\^\w+\]/, md, '"[^2] => " [^2]')
  result &&= check(/\[\^\w+\]\[\^\w+\]/, md, '[^2][^3] => [^2] [^3]')
  result &&= check_global(/[^\-\-\-].*?\.\n[[:word:]].*?[^\-\-\-]/, md, 'saut de ligne incohérent')

  raise 'checkstyle task failed' if !result
end

def find_files(root, subdirs, extensions, reject_pattern = nil)
  # Current directory
  files = Dir.glob("#{root}/*{#{extensions}}")
             .reject { |path| reject_pattern.nil? ? false : path[reject_pattern] }
             .select { |path| File.file?(path) }

  subdirs.each do |subdir|
    files += Dir.glob("#{root}/#{subdir}/**/*{#{extensions}}")
                .reject { |path| reject_pattern.nil? ? false : path[reject_pattern] }
                .select { |path| File.file?(path) }
  end

  return files
end

def check(pattern, files, description, ignore = [])
  result = true
  files.each do |file|
    if !ignore.include? File.basename(file)
      File.foreach(file).with_index do |line, line_num|
        line.match(pattern) do |match|
          puts "#{File.basename(file)}:#{line_num+1}, #{description}, match: '#{match}'"
          result = false
        end
      end
    end
  end
  return result
end

def check_global(pattern, files, description, ignore = [])
  result = true
  files.each do |file|
    if !ignore.include? file
      File.read(file).scan(pattern) do |match|
        puts "#{File.basename(file)}, #{description}, match: '#{match}'"
        result = false
      end
    end
  end
  return result
end

def check_filename(file)
  result = true
  #puts "Check filename #{filename}"

  basename = File.basename(file)

  # Windows reserved characters: \/:*?"<>|
  # Valid URL characters: ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~:/?#[]@!$&'()*+,;=
  # Jekyll does not like ':'
  # ? is replaced by %3F
  # Result: ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~#[]@!$&'()+,;=
  unless basename.match(/^[-\w.~#\[\]@!$&'()+,;=]*$/)
    puts "#{file} KO"
    result = false
  end

  ext = File.extname(basename)
  unless ext.match(/^$|^(.lock)|(.yml)|(.css)|(.scss)|(.html)|(.md)|(.js)|(.txt)|(.xml)|(.atom)|(.rss)|(.svg)|(.png)|(.jpg)|(.ico)$/)
    puts "#{file} '#{ext}' KO"
    result = false
  end

  return result
end
