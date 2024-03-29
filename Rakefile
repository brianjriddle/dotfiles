include FileUtils::Verbose 

rc_files = %w{DIR_COLORS ackrc antopts bash_logout bash_profile bashrc curlrc gemrc gitconfig gitignore hgrc irbrc mailcap newsbeuter/config newsbeuter/urls newsbeuter/bin/bookmark-pinboard.rb profile rspec rvmrc spacemacs tidyrc tmux.conf xinitrc Xresources zshenv zshrc}

desc 'install vimrc to ~/.vimrc' 
task :install_vimrc do
  cp 'vimrc', File.expand_path('~/.vimrc')
  cp 'gvimrc', File.expand_path('~/.gvimrc')
end

desc 'install tmux-conf'
task :install_tmux do
  cp 'tmux.conf', File.expand_path('~/.tmux.conf')
  os = `uname`
  case 
  when os =~ /Darwin/
    cp 'tmux.osx.conf', File.expand_path('~/.tmux.local.conf')
  when os =~ /Linux/
    cp 'tmux.linux.conf', File.expand_path('~/.tmux.local.conf')
  when os =~ /CYGWIN_NT/
    cp 'tmux.cygwin.conf', File.expand_path('~/.tmux.local.conf')
  end
end
desc 'update vim bundles'
task :update_vim_bundles do
  puts "updating vim submodules"
  sh 'git submodule foreach git checkout master'
  sh 'git submodule foreach git pull'
end

desc 'update pathogen'
task :update_pathogen do
  %x{curl --silent https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > vim/autoload/pathogen.vim }
  puts "done updating pathogen"
end

desc 'install vim dir to ~/.vim'
task :install_vim => [:install_vimrc] do
  rm_r File.expand_path('~/.vim'), :force => true
  cp_r 'vim', File.expand_path('~/.vim')
  Dir.glob(File.expand_path('~/.vim/bundle/*/.git*')) do |file|
    rm_r file
  end
end

desc 'checks to see which files are different'
task :check_rcs do
  FileList[rc_files].each do |file| 
    output =  %x{ diff -q #{file} #{File.expand_path("~/.#{file}") } }
    if output =~ /^Files/
      print "vimdiff " + output.gsub(/Files|and|differ/, "")
    else
      print output
    end
  end
end

desc 'install base files'
task :install_base_files do
  mkdir_p File.expand_path "~/.newsbeuter/bin"
  filelist = rc_files - ["gitconfig"]
  FileList[filelist].each do |file| 
    target = File.expand_path("~/.#{file}")
    rm_r target, :secure => true, :force => true
    cp_r file , target # unless file.eql? "gitconfig"
    chmod 0400, target unless file.eql? "spacemacs"
  end
end

desc 'install oh-my-zsh'
task :install_oh_my_zsh do
  sh 'git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
end
