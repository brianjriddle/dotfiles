include FileUtils::Verbose 

rc_files = %w{DIR_COLORS ackrc antopts bash_logout bash_profile bashrc gemrc gitconfig gitignore irbrc js mailcap profile rspec rvmrc tidyrc xinitrc Xresources zshenv zshrc}

desc 'install vimrc to ~/.vimrc' 
task :install_vimrc do
  cp 'vimrc', File.expand_path('~/.vimrc')
  cp 'gvimrc', File.expand_path('~/.gvimrc')
end

task 'tcase' do
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
  end
end
desc 'update vim bundles'
task :update_vim_bundles do
  puts "updating vim submodules"
  sh 'git submodule update --init'
  sh 'git submodule foreach git checkout master'
  sh 'git submodule foreach git pull'
end

desc 'update pathogen'
task :update_pathogen do
  %x{curl https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > vim/autoload/pathogen.vim }
  puts "done updating pathogen"
end

desc 'install vim dir to ~/.vim'
task :install_vim => [:install_vimrc, :update_pathogen] do
  rm_r File.expand_path('~/.vim'), :force => true
  cp_r 'vim', File.expand_path('~/.vim')
  Dir.chdir(File.expand_path('~/.vim/bundle/command-t')) do
    sh "$HOME/.rvm/bin/rvm-shell system -c 'rake clean && rake make'"
  end
end

desc 'checks to see which files are different'
task :check_rcs do
  FileList[rc_files].each do |file| 
    print %x{ diff -q #{file} #{File.expand_path("~/.#{file}") } }
  end
end

desc 'install base files'
task :install_base_files do
  FileList[rc_files].each do |file| 
    cp_r file , File.expand_path("~/.#{file}") unless file.eql? "gitconfig"
  end
end

desc 'install oh-my-zsh'
task :install_oh_my_zsh do
  sh 'git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
end
