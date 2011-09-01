include FileUtils::Verbose 
rc_files = %w{DIR_COLORS ackrc antopts bash_logout bash_profile bashrc curlrc gemrc gitconfig gitignore irbrc profile tidyrc zshenv zshrc}
desc 'install vimrc to ~/.vimrc' 
task :install_vimrc do
  cp 'vimrc', File.expand_path('~/.vimrc')
  cp 'gvimrc', File.expand_path('~/.gvimrc')
end

desc 'update vim bundles'
task :update_vim_bundles do
  puts "updating vim submodules"
  sh 'git submodule foreach git pull'
end

desc 'update pathogen'
task :update_pathogen do
  %x{curl https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > vim/autoload/pathogen.vim }
end

desc 'install vim dir to ~/.vim'
task :install_vim => [:install_vimrc , :update_vim_bundles, :update_pathogen] do
  `git submodule foreach git checkout master`
  rm_r File.expand_path('~/.vim'), :force => true
  cp_r 'vim', File.expand_path('~/.vim')
  Dir.chdir(File.expand_path('~/.vim/bundle/command-t')) do
    sh 'rvm use system && rake clean && rake make && rvm use default'
  end
end

desc 'checks to see which files are different'
task :check_rcs do
  files = FileList[rc_files]
  files.each do |file| 
    print %x{ diff -q #{file} #{File.expand_path("~/.#{file}") } }
  end
end

desc 'install base files'
task :install_base_files do
  files = FileList[rc_files]
  files.each do |file| 
    cp file , File.expand_path("~/.#{file}") unless file.eql? "gitconfig"
  end
end

desc 'install oh-my-zsh'
task :install_oh_my_zsh do
  sh 'git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
end
