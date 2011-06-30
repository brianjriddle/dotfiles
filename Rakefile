include FileUtils::Verbose 
desc 'install vimrc to ~/.vimrc' 
task :install_vimrc do
  cp 'vimrc', File.expand_path('~/.vimrc')
  cp 'gvimrc', File.expand_path('~/.gvimrc')
end

desc 'update vim bundles'
task :upate_vim_bundles do
  sh 'git submodule foreach git pull'
end

desc 'install vim dir to ~/.vim'
task :install_vim => :install_vimrc do
  `git submodule foreach git checkout master`
  `git submodule foreach git pull`
  rm_r File.expand_path('~/.vim'), :force => true
  cp_r 'vim', File.expand_path('~/.vim')
  Dir.chdir(File.expand_path('~/.vim/bundle/command-t')) do
    sh 'rvm use system'
    sh 'rake make'
    sh 'rvm use default'
  end
end

desc 'install base files'
task :install_base_files do
  files = FileList['DIR_COLORS','ackrc', 'antopts','bash_logout', 'bash_profile', 'bashrc', 'curlrc','gitconfig', 'gitignore', 'irbrc', 'profile', 'tidyrc', 'zshenv', 'zshrc']
  files.each do |file| 
    cp file , File.expand_path("~/.#{file}")
  end
end

desc 'install oh-my-zsh'
task :install_oh_my_zsh do
  sh 'git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
end
